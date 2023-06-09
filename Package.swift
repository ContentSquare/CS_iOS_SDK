// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ContentsquareModule",
            targets: ["ContentsquareModuleWrapper"]),
        .library(
            name: "ContentsquareErrorAnalysisModule",
            targets: ["ContentsquareErrorAnalysisModuleWrapper"]
        )
    ],
    dependencies: [
        .package(
            name: "SwiftProtobuf",
            url: "https://github.com/apple/swift-protobuf.git",
            "1.15.0" ..< "2.0.0"),
        .package(
            name: "PLCrashReporter",
            url: "https://github.com/microsoft/plcrashreporter.git",
            "1.11.0" ..< "2.0.0"),
    ],
    targets: [
        // binaryTarget doesn't support dependency, use a wrapper to fix this.
        .target(
            name: "ContentsquareModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareModule"),
                "SwiftProtobuf"
            ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .process("ContentsquareBundle.bundle")
            ]
        ),
        .target(
            name: "ContentsquareErrorAnalysisModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareErrorAnalysisModule"),
                .product(name: "CrashReporter", package: "PLCrashReporter"),
            ],
            path: "ContentsquareErrorAnalysisModuleWrapper"
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.23.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "498160045b6a13dba63388ef3352e66a157e8e46e69a8ebed8604b6fe4253d88"),
        .binaryTarget(
            name: "ContentsquareErrorAnalysisModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.23.0/ContentsquareErrorAnalysisModuleSwiftPackage.xcframework.zip",
            checksum: "037682f4189a6d1ed72d4c3693babfe48b0e9b1666236f1cb01a9d10e8c5020d"),
    ]
)