# IMPORTANT NOTE<br/>******************************************************<br/>This repository is always automatically generated from the CAS Initializr. Do NOT submit pull requests here as the change-set will be overwritten on the next sync.To learn more, please visit the [CAS documentation](https://apereo.github.io/cas).<br/>******************************************************<br/>
Apereo CAS WAR Overlay Template
=====================================

WAR Overlay Type: `cas-config-server-overlay`

# Versions
   

- CAS Server `6.4.6.6`
- JDK `11`
                     
# Build

To build the project, use:

```bash
# Use --refresh-dependencies to force-update SNAPSHOT versions
./gradlew[.bat] clean build
```

To see what commands/tasks are available to the build script, run:

```bash
./gradlew[.bat] tasks
```

If you need to, on Linux/Unix systems, you can delete all the existing artifacts
(artifacts and metadata) Gradle has downloaded using:

```bash
# Only do this when absolutely necessary
rm -rf $HOME/.gradle/caches/
```

Same strategy applies to Windows too, provided you switch `$HOME` to its equivalent in the above command.

# Keystore

For the server to run successfully, you might need to create a keystore file.
This can either be done using the JDK's `keytool` utility or via the following command:

```bash
./gradlew[.bat] createKeystore
```

Use the password `changeit` for both the keystore and the key/certificate entries. 
Ensure the keystore is loaded up with keys and certificates of the server.

## Extension Modules

Extension modules may be specified under the `dependencies` block of the [Gradle build script](build.gradle):

```gradle
dependencies {
    implementation "org.apereo.cas:cas-server-some-module"
    ...
}
```

To collect the list of all project modules and dependencies in the overlay:

```bash
./gradlew[.bat] dependencies
```                                                                       

To see a full list of all project dependencies that are available for configuration and use:

```bash
curl https://localhost:8080/dependencies
```     

Or:

```bash
curl https://localhost:8080/actuator/info
```

# Deployment

On a successful deployment via the following methods, the server will be available at:




* `https:/localhost:8888/casconfigserver`

  
## Executable WAR

Run the server web application as an executable WAR. Note that running an executable WAR requires CAS to use an embedded container such as Apache Tomcat, Jetty, etc.


No servlet container is specified for the current build. Examine your `gradle.properties` file
and modify the `appServer` property to point to the appropriate container of choice.
```bash
java -jar build/libs/casconfigserver.war
```

Or via:

```bash
./gradlew[.bat] run
```

Debug the CAS web application as an executable WAR:

```bash
./gradlew[.bat] debug
```
       
Or via:

```bash
java -Xdebug -Xrunjdwp:transport=dt_socket,address=5000,server=y,suspend=y -jar build/libs/casconfigserver.war
```

Run the CAS web application as a *standalone* executable WAR:

```bash
./gradlew[.bat] clean executable
```

## External

Deploy the binary web application file in `build/libs` after a successful build to a servlet container of choice.

# Docker

The following strategies outline how to build and deploy CAS Docker images.

## Jib

The overlay embraces the [Jib Gradle Plugin](https://github.com/GoogleContainerTools/jib) to provide easy-to-use out-of-the-box tooling for building CAS docker images. Jib is an open-source Java containerizer from Google that lets Java developers build containers using the tools they know. It is a container image builder that handles all the steps of packaging your application into a container image. It does not require you to write a Dockerfile or have Docker installed, and it is directly integrated into the overlay.

```bash
# Running this task requires that you have Docker installed and running.
./gradlew build jibDockerBuild
```
