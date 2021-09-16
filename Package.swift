// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
// WIP.
import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [.iOS(.v10)],
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
            path: "ContentsquareModuleWrapper"),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "",
            checksum: ""),
    ]
)
