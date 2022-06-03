// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShinySwiftUI",
    platforms: [
      .iOS(.v13), .macOS(.v10_15), .watchOS(.v8)
    ],
    products: [
        .library(
            name: "ShinySwiftUI",
            targets: ["ShinySwiftUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ShinySwiftUI",
            dependencies: []
        ),
        .testTarget(
            name: "ShinySwiftUITests",
            dependencies: ["ShinySwiftUI"]),
    ]
)
