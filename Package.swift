// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let targets = [
    "libbackend","libbasis_transcoder","libcamutils","libcivetweb","libdracodec","libfilabridge","libfilaflat","libfilamat","libfilament-iblprefilter","libfilament","libfilameshio","libgeometry","libgltfio_core","libibl-lite","libibl","libimage","libktxreader","libmeshoptimizer","libmikktspace","libshaders","libsmol-v","libstb","libuberarchive","libuberzlib","libutils","libviewer","libvkshaders","libzstd"
]

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
            dependencies: targets.map({ .byName(name: $0) }),
            path: "Bindings"
        )
    ] + targets.map({ .binaryTarget(name: $0, path: "lib/\($0).xcframework") })),
    cxxLanguageStandard: .cxx17
)
