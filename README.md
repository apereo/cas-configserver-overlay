CAS Spring Cloud Configuration Server Overlay Template
============================

Generic CAS Spring Cloud Configuration Server WAR overlay.

# Versions

```xml
<cas.version>5.1.x</cas.version>
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

On a successful deployment via the following methods, the configuration server will be available at:

* `http://cas.server.name:8888/casconfigserver`

## Executable WAR

Run the configuration server web application as an executable WAR.

```bash
./build.sh run
```

## Spring Boot

Run the configuration server web application as an executable WAR via Spring Boot. This is most useful during development and testing.

```bash
./build.sh bootrun
```

## External

Deploy resultant `target/casconfigserver.war`  to a servlet container of choice.