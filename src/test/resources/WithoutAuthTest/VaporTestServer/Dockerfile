FROM vapor/swift:5.1

# Install sqlite3
RUN apt-get update -y \
        && apt-get install -y libsqlite3-dev

WORKDIR /package

COPY src/test/resources/WithoutAuthTest/VaporTestServer ./VaporTestServer
COPY src/test/resources/WithoutAuthTest/VaporTestInterface ./VaporTestInterface

WORKDIR /package/VaporTestServer

RUN swift package resolve
RUN swift package clean

CMD ["swift", "test"]

