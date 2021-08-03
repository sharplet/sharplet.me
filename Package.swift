// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "Blog",
    platforms: [
        .macOS("11.0"),
    ],
    dependencies: [
        .package(name: "Vapor", url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(name: "FluentSQLite", url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
    ],
    targets: [
        .executableTarget(name: "Run", dependencies: ["App"]),
        .target(name: "App", dependencies: ["FluentSQLite", "Vapor"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)
