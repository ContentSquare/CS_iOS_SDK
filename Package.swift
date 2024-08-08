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
    ],
    dependencies: [
        .package(
            name: "SwiftProtobuf",
            url: "https://github.com/apple/swift-protobuf.git",
            "1.15.0" ..< "2.0.0"),
        .package(
            name: "CSCrashReporter",
            url: "https://github.com/ContentSquare/CS_iOS_CrashReporter.git",
            .exact("1.0.0")),
    ],
    targets: [
        // binaryTarget doesn't support dependency, use a wrapper to fix this.
        .target(
            name: "ContentsquareModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareModule"),
                "SwiftProtobuf",
                "CSCrashReporter"
            ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .process("ContentsquareBundle.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.35.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "db6b99db0a22da5e98cca42359dc89efb3e220a7ad6852176fb11cf2dfbc460c"),
    ]
)