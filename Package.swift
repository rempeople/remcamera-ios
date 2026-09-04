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
            url: "https://github.com/rempeople/remcamera-ios/releases/download/0.2.1/RemCamera-0.2.1.xcframework.zip",
            checksum: "0c007056c3d270dcd66f7990717036dd58061535aac438d895d73ed7a7825f56"
        ),
        .binaryTarget(
            name: "GoogleToolboxForMac",
            url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0/GoogleToolboxForMac.xcframework.zip",
            checksum: "e73f79a048c95236ebc04829cc3b4fb0b0e1902d65650fc3cb187c233dbff5a1"
        )
    ]
)
