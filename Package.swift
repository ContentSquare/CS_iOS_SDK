// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ContentsquareModule",
            targets: ["ContentsquareModuleWrapper"]),
    ],
     dependencies: [
         .package(
             name: "CSSwiftProtobuf",
             url: "https://github.com/ContentSquare/CSSwiftProtobuf.git",
             .exact("1.33.3")),
         .package(
             name: "CSCrashReporter",
             url: "https://github.com/ContentSquare/CS_iOS_CrashReporter.git",
             .exact("1.0.1")),
         .package(
             name: "ContentsquareCore",
             url: "https://github.com/ContentSquare/apple-core-sdk.git",
             .exact("0.1.4")),
     ],
     targets: [
         // binaryTarget doesn't support dependency, use a wrapper to fix this.
         .target(
             name: "ContentsquareModuleWrapper",
             dependencies: [
                 .target(name: "ContentsquareModule"),
                 "CSSwiftProtobuf",
                 "CSCrashReporter",
                 "ContentsquareCore"
             ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .process("ContentsquareBundle.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.51.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "8aacd053190ee035fd107c816e5cf6bacd5f9c60b90ed1e6fc52de20a5fdc309"),
    ]
)