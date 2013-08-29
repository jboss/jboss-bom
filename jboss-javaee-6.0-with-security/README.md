JBoss Java EE 6 with Security
=============================

This BOM builds on the Java EE full profile BOM, adding Picketlink.
 
Usage
-----

To use the BOM, import into your dependency management:

    <dependencyManagement>
        <dependencies>
            <dependency>
               <groupId>org.jboss.bom</groupId>
               <artifactId>jboss-javaee-6.0-with-security</artifactId>
               <version>1.0.7.Final</version>
               <type>pom</type>
               <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
