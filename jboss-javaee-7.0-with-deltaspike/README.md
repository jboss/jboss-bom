JBoss Java EE 7 with Deltaspike
===============================

This BOM builds on the Java EE full profile BOM, adding Deltaspike.
 
Usage
-----

To use the BOM, import into your dependency management:

    <dependencyManagement>
        <dependencies>
            <dependency>
               <groupId>org.jboss.bom</groupId>
               <artifactId>jboss-javaee-7.0-eap-with-deltaspike</artifactId>
               <version>7.0.0-SNAPSHOT</version>
               <type>pom</type>
               <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
