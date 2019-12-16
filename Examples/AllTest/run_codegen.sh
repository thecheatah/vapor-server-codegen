#!/bin/sh

docker run --rm -v "$(pwd):/output" synology:5350/swagger-codegen/swift/vapor-server-codegen -i codegen_test.yml -o ./VaporTestInterface --additional-properties projectName=VaporTestInterface
