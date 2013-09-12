#!/bin/sh

# Require BASH 3 or newer

REQUIRED_BASH_VERSION=3.0.0

if [[ $BASH_VERSION < $REQUIRED_BASH_VERSION ]]; then
  echo "You must use Bash version 3 or newer to run this script"
  exit
fi

if [[ -z "$RELEASE_REPO_URL" ]]; then
  echo "You must set the RELEASE_REPO_URL environment variable to your local checkout of https://github.com/jboss-developer/temp-maven-repo"
  exit
fi

# Canonicalise the source dir, allow this script to be called anywhere
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# DEFINE

SNAPSHOT_REPO_ID="jboss-snapshots-repository"
RELEASE_REPO_ID="jboss-releases-repository"

# SCRIPT

usage()
{
cat << EOF
usage: $0 options

This script aids in releasing the BOMs 

OPTIONS:
   -u      Updates version numbers in all POMs, used with -o and -n      
   -o      Old version number to update from
   -n      New version number to update to
   -m      Generate html versions of markdown readmes
   -s      Deploy a snapshot of the BOMs 
   -r      Deploy a release of the BOMs
   -h      Shows this message
EOF
}

update()
{
cd $DIR
echo "Updating versions from $OLDVERSION TO $NEWVERSION for all Java, Markdown and XML files under $PWD"
perl -pi -e "s/${OLDVERSION}/${NEWVERSION}/g" `find . -name \*.xml -or -name \*.java -or -name \*.md`
}

snapshot()
{
    mvn clean deploy -DaltDeploymentRepository=${SNAPSHOT_REPO_ID}::default::${SNAPSHOT_REPO_URL}
}

markdown_to_html()
{
   cd $DIR
   readmes=`find . -iname readme.md -or -iname contributing.md`
   echo $readmes
   for readme in $readmes
   do
      output_filename=${readme//.md/.html}
      output_filename=${output_filename//.MD/.html}
      markdown $readme -f $output_filename  
   done
}

release()
{
    mvn clean deploy -DaltDeploymentRepository=${RELEASE_REPO_ID}::default::${RELEASE_REPO_URL} -Prelease
    #org.sonatype.plugins:nexus-staging-maven-plugin:deploy org.sonatype.plugins:nexus-staging-maven-plugin:release -DnexusUrl=https://repository.jboss.org/nexus -DserverId=jboss-releases-repository -Dautomatic=true -DtargetRepositoryId=releases
}

OLDVERSION="1.0.0-SNAPSHOT"
NEWVERSION="1.0.0-SNAPSHOT"
CMD="usage"

while getopts “muo:n:r” OPTION

do
     case $OPTION in
         u)
             CMD="update"
             ;;
         h)
             usage
             exit
             ;;
         o)
             OLDVERSION=$OPTARG
             ;;
         n)
             NEWVERSION=$OPTARG
             ;;
         m)
             CMD="markdown_to_html"
             ;;
         s)
             CMD="snapshot"
             ;;
         r)  
             CMD="release"
             ;;
         [?])
             usage
             exit
             ;;
     esac
done

$CMD

