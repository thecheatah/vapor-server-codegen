#!/bin/sh

docker run --rm -v "$(pwd):/output" synology:5350/swagger-codegen/swift/vapor-server-codegen -i codegen_test.yml -o ./VaporTestInterface --additional-properties projectName=VaporTestInterface

#mvn -Dmaven.test.skip=true package
#java -DdebugModels -DdebugOperations -DdebugSupportingFiles -cp ../../../../target/SwiftVapor3-swagger-codegen-1.0.0.jar:/Users/rsingh/.m2/repository/io/swagger/codegen/v3/swagger-codegen-cli/3.0.7/swagger-codegen-cli-3.0.7.jar io.swagger.codegen.v3.cli.SwaggerCodegen generate -l SwiftVapor3 -i ./codegen_test.yml -o ../../../../target/test-classes/WithoutAuthTest/VaporTestInterface --additional-properties projectName=VaporTestInterface > codegen.out
