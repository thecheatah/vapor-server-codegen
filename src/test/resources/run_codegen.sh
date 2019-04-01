#!/bin/sh

#mvn -Dmaven.test.skip=true package
java -DdebugModels -DdebugOperations -DdebugSupportingFiles -cp ../../../target/SwiftVapor3-swagger-codegen-1.0.0.jar:/Users/rsingh/.m2/repository/io/swagger/codegen/v3/swagger-codegen-cli/3.0.5/swagger-codegen-cli-3.0.5.jar io.swagger.codegen.v3.cli.SwaggerCodegen generate -l SwiftVapor3 -i ./codegen_test.yml -o ../../../target/test-classes/swift/VaporTestInterface --additional-properties projectName=VaporTestInterface
