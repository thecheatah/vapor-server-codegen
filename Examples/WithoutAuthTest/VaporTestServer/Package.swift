// swift-tools-version:5.1
import PackageDescription

let package = Package(
  name: "VaporTestServer",
  platforms: [
    .macOS(.v10_14)
  ],
  products: [
    .executable(name: "Run", targets: ["Run"]),
    .library(name: "App", targets: ["App"]),
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-beta.2.1"),
    .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0-beta.2"),
    .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0-beta.2"),
    .package(path: "../VaporTestInterface/")
  ],
  targets: [
    .target(name: "App", dependencies: ["Fluent", "FluentSQLiteDriver", "Vapor", "VaporTestInterface"]),
    .target(name: "Run", dependencies: ["App"]),
    .testTarget(name: "AppTests", dependencies: ["App", "XCTVapor"])
  ]
)
