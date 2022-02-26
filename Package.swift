// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShinySwiftUI",
    platforms: [
      .iOS(.v13), .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ShinySwiftUI",
            targets: ["ShinySwiftUI"]),
    ],
    dependencies: [
      .package(url: "https://github.com/SwiftUIX/SwiftUIX", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "ShinySwiftUI",
            dependencies: [
              .product(name: "SwiftUIX", package: "SwiftUIX")
            ]),
        .testTarget(
            name: "ShinySwiftUITests",
            dependencies: ["ShinySwiftUI"]),
    ]
)
