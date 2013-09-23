JBoss Java EE 6 with Resteasy
=============================

This BOM builds on the Java EE full profile BOM, adding Resteasy.
 
Usage
-----

To use the BOM, import into your dependency management:

    <dependencyManagement>
        <dependencies>
            <dependency>
               <groupId>org.jboss.bom.eap</groupId>
               <artifactId>jboss-javaee-6.0-with-resteasy</artifactId>
               <version>6.2.0-build-SNAPSHOT</version>
               <type>pom</type>
               <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
