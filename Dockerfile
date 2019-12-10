FROM openjdk:8-jre-alpine
MAINTAINER Ravneet Singh

WORKDIR /usr/codegen/bin

COPY target/swagger-codegen-cli-3.0.14.jar swagger-codegen-cli-3.0.14.jar
COPY target/SwiftVapor3-swagger-codegen-1.0.0.jar SwiftVapor3-swagger-codegen-1.0.0.jar

WORKDIR /output
ENTRYPOINT ["java","-cp","/usr/codegen/bin/SwiftVapor3-swagger-codegen-1.0.0.jar:/usr/codegen/bin/swagger-codegen-cli-3.0.14.jar", "io.swagger.codegen.v3.cli.SwaggerCodegen", "generate", "-l", "SwiftVapor3"]
