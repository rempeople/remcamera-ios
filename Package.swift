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
            url: "https://iosremcamerasdkstorage.blob.core.windows.net/frameworks/RemCamera-0.2.1.xcframework.zip?sp=r&st=2026-09-04T19:38:14Z&se=2026-12-05T03:53:14Z&spr=https&sv=2026-02-06&sr=b&sig=SUl2wWK2B7sYGZqE4kVo%2FYZ568ij8ExCEnaro1Khhfg%3D",
            checksum: "8ff97a63af25ee69e60c8d31582e6ce68815d48dcbb01751c5fde04123c63bf5"
        ),
        .binaryTarget(
            name: "GoogleToolboxForMac",
            url: "https://github.com/d-date/google-mlkit-swiftpm/releases/download/9.0.0/GoogleToolboxForMac.xcframework.zip",
            checksum: "e73f79a048c95236ebc04829cc3b4fb0b0e1902d65650fc3cb187c233dbff5a1"
        )
    ]
)
