// swift-tools-version:5.1
//
// Автор: Егор Олегович

import PackageDescription

let package = Package(
    name: "JetNavigation",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "JetNavigation",targets: ["JetNavigation"])
    ],
    targets: [
        .target(
            name: "JetNavigation",
            dependencies: []
        ),
        .testTarget(
            name: "JetNavigationTests",
            dependencies: ["JetNavigation"]
        ),
    ],
    swiftLanguageVersions: [ .version("5.1") ]
)
