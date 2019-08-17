// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "GetRecentSongs",
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "4.3.0")),
        .package(url: "https://github.com/RyanMKrol/SwiftToolbox.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "GetRecentSongs",
            dependencies: ["SwiftToolbox"]),
        .testTarget(
            name: "GetRecentSongsTests",
            dependencies: ["GetRecentSongs"]),
    ]
)
