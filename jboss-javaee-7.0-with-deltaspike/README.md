JBoss Java EE 6 with Deltaspike
===============================

This BOM builds on the Java EE full profile BOM, adding Deltaspike.
 
Usage
-----

To use the BOM, import into your dependency management:

    <dependencyManagement>
        <dependencies>
            <dependency>
               <groupId>org.jboss.bom.wfk</groupId>
               <artifactId>jboss-javaee-6.0-with-deltaspike</artifactId>
               <version>2.7.0-redhat-1</version>
               <type>pom</type>
               <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
