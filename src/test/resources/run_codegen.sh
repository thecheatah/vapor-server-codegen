#!/bin/sh

java -DdebugModels -DdebugOperations -DdebugSupportingFiles -cp ../SwiftVapor3-swagger-codegen-1.0.0.jar:../../../Swagger/codegen/swagger-codegen-cli.jar io.swagger.codegen.v3.cli.SwaggerCodegen generate -l SwiftVapor3 -i ./MobileAPI.yml -o ./MobileAPIVapor --additional-properties projectName=MobileApiVapor
