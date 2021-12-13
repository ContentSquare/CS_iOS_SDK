// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "ContentsquareModule",
            targets: ["ContentsquareModuleWrapper"]),
    ],
    dependencies: [
        .package(
            name: "SwiftProtobuf",
            url: "https://github.com/apple/swift-protobuf.git",
            "1.15.0" ..< "2.0.0"),
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
            ]),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/v4.10.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "8c00b2a6660d3521abb501b0a6a847650d0e7ae5b69291f63bec82f6e0252b75"),
    ]
)