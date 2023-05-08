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
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.22.1/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "6138b4648d8a314ddbacdbf08cddb6805fcdb86e403d13ad12c2c28979d3c613"),
        .binaryTarget(
            name: "ContentsquareErrorAnalysisModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.22.1/ContentsquareErrorAnalysisModuleSwiftPackage.xcframework.zip",
            checksum: "a777ad50feb37fbdbd2237984dac8e3aeb2bf754a1ff1e3c059a834ac4992dce"),
    ]
)