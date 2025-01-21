// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestSPM",
    products: [
        .library(
            name: "TestSPM",
            targets: ["TestSPM"]
        ),
        .library(
            name: "Bindings",
            targets: ["Bindings"]
        ),
    ],
    targets: ([
        .target(
            name: "TestSPM",
            dependencies: [
                .target(name: "Bindings"),
            ],
            path: "Helpers"
        ),
        .target(
            name: "Bindings",
            path: "Bindings"
        )
    ])
)
