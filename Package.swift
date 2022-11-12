// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "IndirectlyCodable",
    products: [
        .library(
            name: "IndirectlyCodable",
            targets: ["IndirectlyCodable"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "IndirectlyCodable",
            dependencies: []
        ),
        .testTarget(
            name: "IndirectlyCodableTests",
            dependencies: ["IndirectlyCodable"]
        ),
    ]
)
