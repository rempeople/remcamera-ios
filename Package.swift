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
            url: "https://github.com/rempeople/remcamera-ios/releases/download/0.2.2/RemCamera-0.2.1.xcframework.zip",
            checksum: "17b1e38b01dcc7df2f662f03db7ecef9bcaa24339c5855c33c1d9ff441dcc819"
        ),
        .binaryTarget(
            name: "GoogleToolboxForMac",
            url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0/GoogleToolboxForMac.xcframework.zip",
            checksum: "e73f79a048c95236ebc04829cc3b4fb0b0e1902d65650fc3cb187c233dbff5a1"
        )
    ]
)
