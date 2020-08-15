// swift-tools-version:5.3
//
// Created by: Egor Boyko

import PackageDescription

let package = Package(
    name: "JetNavigation",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "JetNavigation",targets: ["JetNavigation"])
    ],
    targets: [
        .target(
            name: "JetNavigation",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "JetNavigationTests",
            dependencies: ["JetNavigation"]
        ),
    ],
    swiftLanguageVersions: [ .version("5.1") ]
)
