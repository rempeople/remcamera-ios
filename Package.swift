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

            ],
            resources: [
                .copy("GoogleMVFaceDetectorResources.bundle")
            ]
        ),
        .binaryTarget(
            name: "RemCamera",
            url: "https://iosremcamerasdkstorage.blob.core.windows.net/frameworks/RemCamera-0.2.0.xcframework.zip?sp=r&st=2026-09-04T12:12:38Z&se=2026-09-12T20:27:38Z&spr=https&sv=2026-02-06&sr=b&sig=frG9vzooUPHyyHhwVM%2BFKU7jLg5wuoymGQrMTpt%2BnHs%3D",
            checksum: "0cd5ed00590092330696ab0b570378785a97663abd46026d95e2ceac2cc21852"
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
