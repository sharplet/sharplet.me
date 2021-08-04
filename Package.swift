// swift-tools-version:5.4

import PackageDescription

let package = Package(
  name: "Blog",
  platforms: [
    .macOS(.v11),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/fluent.git", from: "4.3.1"),
    .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.1.0"),
    .package(url: "https://github.com/vapor/sqlite-nio.git", from: "1.1.0"),
    .package(url: "https://github.com/vapor/vapor.git", from: "4.48.3"),
  ],
  targets: [
    .executableTarget(name: "Run", dependencies: ["App"]),
    .target(
      name: "App",
      dependencies: [
        .product(name: "Fluent", package: "fluent"),
        .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
        .product(name: "SQLiteNIO", package: "sqlite-nio"),
        .product(name: "Vapor", package: "vapor"),
      ]
    ),
    .testTarget(name: "AppTests", dependencies: ["App"]),
  ]
)
