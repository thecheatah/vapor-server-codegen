#!/bin/sh
source .env

mvn -Dmaven.test.skip=true package
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://download.java.net/maven/2/ -Dartifact=io.swagger.codegen.v3:swagger-codegen-cli:$CODE_GEN_CLI_VERSION
cp ~/.m2/repository/io/swagger/codegen/v3/swagger-codegen-cli/$CODE_GEN_CLI_VERSION/swagger-codegen-cli-$CODE_GEN_CLI_VERSION.jar target
docker build -t $DOCKER_IMAGE .

