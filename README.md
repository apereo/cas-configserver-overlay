CAS Overlay Template
============================

Generic CAS WAR overlay to exercise the latest versions of CAS. This overlay could be freely used as a starting template for local CAS war overlays. The CAS services management overlay is available [here](https://github.com/apereo/cas-services-management-overlay).

# Versions

```xml
<cas.version>5.0.x</cas.version>
```

# Requirements
* JDK 1.8+

# Configuration

The `etc` directory contains the configuration files and directories that need to be copied to `/etc/cas/config`.

# Build

To see what commands are available to the build script, run:

```bash
./build.sh help
```

To package the final web application, run:

```bash
./build.sh package
```

To update `SNAPSHOT` versions run:

```bash
./build.sh package -U
```

# Deployment

- Create a keystore file `thekeystore` under `/etc/cas`. Use the password `changeit` for both the keystore and the key/certificate entries.
- Ensure the keystore is loaded up with keys and certificates of the server.

On a successful deployment via the following methods, CAS will be available at:

* `http://cas.server.name:8080/cas`
* `https://cas.server.name:8443/cas`

## Executable WAR

Run the CAS web application as an executable WAR.

```bash
./build.sh run
```

## Spring Boot

Run the CAS web application as an executable WAR via Spring Boot. This is most useful during development and testing.

```bash
./build.sh bootrun
```

## External

Deploy resultant `target/cas.war`  to a servlet container of choice.

### Tomcat Context Fragments

**EXPERIMENTAL**

If your external container is Apache Tomcat, you may be able to use a context fragment
to have Tomcat locate the CAS web application directly inside the `target` directory, which
would relieve you from having to build/copy/deploy every time you make a change.

Create the file `$TOMCAT_HOME/conf/Catalina/localhost/cas.xml` with the following,
where `$CAS_HOME` is the location of your CAS overlay directory:

```xml
<Context docBase="$CAS_HOME/target/cas.war"
         privileged="true"
         antiResourceLocking="false"
         antiJARLocking="false"
         unpackWAR="true"
         swallowOutput="true" />
```

You might also want to add `cookies="false"` to the above fragment as well.
Consult the Tomcat documentation for more info.
