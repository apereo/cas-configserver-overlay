#!/bin/bash

function clean() {
	./gradlew clean "$@"
}

function package() {
	./gradlew clean build "$@"
}

function debug() {
	package && java -Xdebug -Xrunjdwp:transport=dt_socket,address=5010,server=y,suspend=n -jar build/libs/casconfigserver.war
}

function run() {
	package && java -jar build/libs/casconfigserver.war
}

if [ $# -eq 0 ]; then
    echo -e "No commands provided. Defaulting to [run]\n"
    run
    exit 0
fi


case "$1" in
"clean")
	shift
    clean "$@"
    ;;
"package")
	shift
    package "$@"
    ;;
"run")
    run "$@"
    ;;
*)
    help
    ;;
esac

