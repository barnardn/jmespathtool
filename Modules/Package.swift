// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Dependency Convenience
extension Target.Dependency {
    // MARK: Internal
    static var appKitools: Self { "AppKitTools" }
    static var foundationTools: Self { "FoundationTools" }

    // MARK: 3rd Party
    static var jmespath: Self {
        .product(name: "JMESPath", package: "jmespath.swift")
    }

    static var dependencies: Self {
        .product(name: "Dependencies", package: "swift-dependencies")
    }
}

// MARK: - Package Definition
let package = Package(
    name: "Modules",
    platforms: [.macOS(.v14)],
    products: [
        // MARK: local packages
        .library(name: "AppKitTools", targets: ["AppKitTools"]),
        .library(name: "FoundationTools", targets: ["FoundationTools"]),

        // MARK: third party libraries
        .library(name: "JMESPathClient", targets: ["JMESPathClient"]),

    ],
    dependencies: [
        .package(url: "https://github.com/adam-fowler/jmespath.swift", from: "1.0.2"),

        // Pointfree
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0"),

        // Test Dependencies
    ],
    targets: [
        // Internal Helpers
        .target(
            name: "JMESPathClient",
            dependencies: [
                .jmespath,
                .dependencies,
                .foundationTools,
            ]
        ),
        .target(
            name: "AppKitTools",
            dependencies: [
                .dependencies,
            ]
        ),
        .target(
            name: "FoundationTools"
        ),
    ]
)
