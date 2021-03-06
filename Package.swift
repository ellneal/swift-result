// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Result",
    products: [
        .library(
            name: "Result",
            targets: ["Result"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Result",
            dependencies: []),
        .testTarget(
            name: "ResultTests",
            dependencies: ["Result"]),
    ]
)
