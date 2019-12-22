#!/bin/sh

docker run --rm -v "$(pwd):/output" thecheatah/vapor-server-codegen:4 -i codegen_test.yml -o ./VaporTestInterface --additional-properties projectName=VaporTestInterface

