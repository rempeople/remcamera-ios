// swift-tools-version: 5.9
import PackageDescription

let mlkitBase = "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0"

let package = Package(
    name: "RemCamera",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "RemCamera", targets: ["RemCameraSupport"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", exact: "2.4.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", exact: "8.1.0"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", exact: "3.5.0"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", exact: "10.1.0"),
        .package(url: "https://github.com/firebase/nanopb.git", exact: "2.30910.0"),
    ],
    targets: [
        .target(
            name: "RemCameraSupport",
            dependencies: [
                "RemCamera",
                "MLKitFaceDetection",
                "MLKitVision",
                "MLImage",
                "MLKitCommon",
                "GoogleToolboxForMac",
                "Common",
            ],
            resources: [
                .copy("GoogleMVFaceDetectorResources.bundle")
            ]
        ),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]
        ),
        .binaryTarget(
            name: "RemCamera",
            url: "https://github.com/rempeople/remcamera-ios/releases/download/v0.1.0/RemCamera-0.1.0.xcframework.zip",
            checksum: "3823b0bac5638068143b58b0c94ab76986d40d9a54fdb4a1c4e08a9e2bec6156"
        ),
        .binaryTarget(
            name: "MLKitFaceDetection",
            url: "\(mlkitBase)/MLKitFaceDetection.xcframework.zip",
            checksum: "5089e34533f0ff73c8a6960acde038432e23c917f8d677bf53ed5f98f1757f69"
        ),
        .binaryTarget(
            name: "MLKitVision",
            url: "\(mlkitBase)/MLKitVision.xcframework.zip",
            checksum: "580a878c207afa098947b7b751ed75354dd4f422602d721f78df6a4fd60e91ac"
        ),
        .binaryTarget(
            name: "MLImage",
            url: "\(mlkitBase)/MLImage.xcframework.zip",
            checksum: "b2d09a93c6aee77a1c5c613d5ff356c621ecc5dbfb90e5debd1ae49c222bb740"
        ),
        .binaryTarget(
            name: "MLKitCommon",
            url: "\(mlkitBase)/MLKitCommon.xcframework.zip",
            checksum: "180770a261c534043de3b9d81ff2b3ff0b867fedb4e06587b2715deda1b0bd7c"
        ),
        .binaryTarget(
            name: "GoogleToolboxForMac",
            url: "\(mlkitBase)/GoogleToolboxForMac.xcframework.zip",
            checksum: "e73f79a048c95236ebc04829cc3b4fb0b0e1902d65650fc3cb187c233dbff5a1"
        ),
    ]
)
