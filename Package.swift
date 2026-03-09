// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "XsollaMobileSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "XsollaMobileSDK",
            targets: ["XsollaMobileSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "XsollaMobileSDK",
            path: "XsollaMobileSDK.xcframework"
        ),
    ]
)
