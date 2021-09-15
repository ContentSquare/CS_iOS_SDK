// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ContentsquareModule",
            type: .dynamic,
            targets: ["ContentsquareModule"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
              name: "SwiftProtobuf",
              url: "https://github.com/apple/swift-protobuf.git",
              "1.15.0" ..< "2.0.0"
            ),
    ],
    targets: [
        
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "ContentsquareModule", url: "https://github.com/wangjiejacques/CS_iOS_SDK/releases/download/4.4.2/ContentsquareModule.xcframework.zip", checksum: "b99b03b31af43bce20da0e4a3f75722548392a0e9266cbe23867ea2b5b87006b"),
        .target(name: "ContentsquareModuleTarget", dependencies: [
            .target(name: "ContentsquareModule"),
            "SwiftProtobuf"
        ], path: "ContentsquareModuleTarget")
    ]
)
