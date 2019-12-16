// swift-tools-version:5.1
import PackageDescription

let package = Package(
  name: "VaporTestInterface",
  platforms: [
    .macOS(.v10_14)
  ],
  products: [
    .library(name: "VaporTestInterface", targets: ["VaporTestInterface"])
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-beta.2.1"),
  ],
  targets: [
    .target(name: "VaporTestInterface", dependencies: ["Vapor"])
  ]
)
