// swift-tools-version: 5.9
import PackageDescription

// RemCamera.xcframework already statically embeds ML Kit Face Detection +
// GoogleDataTransport / Clearcut. Do NOT also link those SPM products here —
// duplicate Clearcut uploaders crash with:
//   -[MLKITx_CCTLogContext hashForFilePath]: unrecognized selector
let package = Package(
    name: "RemCamera",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "RemCamera", targets: ["RemCameraSupport"])
    ],
    targets: [
        .target(
            name: "RemCameraSupport",
            dependencies: [
                "RemCamera",
                "GoogleToolboxForMac"
            ]
        ),
        .binaryTarget(
            name: "RemCamera",
            url: "https://github.com/rempeople/remcamera-ios/releases/download/0.2.3/RemCamera-0.2.3.xcframework.zip",
            checksum: "6b7f2717645462523e6e2a193a28f5484e86a564937ed5b9cf4bbf1c0a89ac4d"
        ),
        .binaryTarget(
            name: "GoogleToolboxForMac",
            url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0/GoogleToolboxForMac.xcframework.zip",
            checksum: "e73f79a048c95236ebc04829cc3b4fb0b0e1902d65650fc3cb187c233dbff5a1"
        )
    ]
)
