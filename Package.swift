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
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.24.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "9ce2cc60ea4562b0bfc4e23be8b4d0286e24264a7424d0c07c8c56f9b88a8093"),
        .binaryTarget(
            name: "ContentsquareErrorAnalysisModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.24.0/ContentsquareErrorAnalysisModuleSwiftPackage.xcframework.zip",
            checksum: "90a14a7e706062720eb57d679766067497ab965e7ee18fdbd563ce857e1a3f44"),
    ]
)