// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ContentsquareModule",
            targets: ["ContentsquareModuleTarget"]),
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
        .binaryTarget(name: "ContentsquareModule", url: "https://github.com/wangjiejacques/CS_iOS_SDK/releases/download/4.4.9/ContentsquareModule.xcframework.zip", checksum: "37e8b0b7f1331dc9cca5279123f80fac887ff2ae27d4c0b57738e397c7061894"),
        .target(name: "ContentsquareModuleTarget", dependencies: [
            .target(name: "ContentsquareModule"),
            "SwiftProtobuf"
        ], path: "ContentsquareModuleTarget")
    ]
)
