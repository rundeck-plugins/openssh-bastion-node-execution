#!/usr/bin/env bash
#compile
./gradlew clean build

cp build/libs/openssh-bastion-node-executor* docker/rundeck/plugins
cd docker
make clean
make build
make start
