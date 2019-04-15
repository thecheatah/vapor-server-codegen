FROM swift:4.2

WORKDIR /package

COPY src/test/resources/swift/VaporTestServer ./VaporTestServer
COPY target/test-classes/swift/VaporTestInterface ./VaporTestInterface

WORKDIR /package/VaporTestServer

RUN swift package resolve
RUN swift package clean

CMD ["swift", "test"]

