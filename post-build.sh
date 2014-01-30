#!/bin/bash

TARGET=$1
CWD=$PWD

# Setup SSH Keys
rm -rf $TARGET/root/.ssh
mkdir -p $TARGET/root/.ssh
touch $TARGET/root/.ssh/authorized_keys
cat $CWD/keys/* > $TARGET/root/.ssh/authorized_keys
chmod 700 $TARGET/root/.ssh
chmod 400 $TARGET/root/.ssh/*

# Install docker
curl -q -o $TARGET/usr/bin/docker https://get.docker.io/builds/Linux/x86_64/docker-latest
chmod 755 $TARGET/usr/bin/docker
