// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1),
    ],
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
             .exact("0.2.4")),
         .package(
             name: "ContentsquareUICore",
             url: "https://github.com/contentsquare/ios-ui-core-sdk.git",
             .exact("0.2.1")),
     ],
     targets: [
         // binaryTarget doesn't support dependency, use a wrapper to fix this.
         .target(
             name: "ContentsquareModuleWrapper",
             dependencies: [
                 .target(name: "ContentsquareModule", condition: .when(platforms: [ .iOS ])),
                 "CSSwiftProtobuf",
                 .product(name: "CSCrashReporter", package: "CSCrashReporter", condition: .when(platforms: [ .iOS ])),
                 "ContentsquareCore",
                 .product(name: "ContentsquareUICore", package: "ContentsquareUICore", condition: .when(platforms: [ .iOS, .macCatalyst ]))
             ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .copy("ContentsquareBundle.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK/releases/download/4.53.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "34bc9241f04c0c9643c52f0164a2aad7ab143f1906e9a51628c177f12891b7d0"),
    ]
)