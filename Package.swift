// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PassyCoreMSALPackage",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "PassyCoreMSAL",
                 targets: ["PassyCoreMSALDependencies"])
    ],
    dependencies: [
        .package(url: "https://github.com/PassySRL/PassyCorePackage.git", exact: "1.0.37"),
        .package(url: "https://github.com/AzureAD/microsoft-authentication-library-for-objc.git",
                 from: "1.0.0")
    ],
    targets: [
        .target(name: "PassyCoreMSALDependencies",
                dependencies: ["PassyCoreMSAL",
                               .product(name: "PassyCore",
                                        package: "PassyCorePackage"),
                               .product(name: "MSAL",
                                        package: "microsoft-authentication-library-for-objc")]),
        .binaryTarget(name: "PassyCoreMSAL",
                      url: "https://github.com/PassySRL/PassyCoreMSALPackage/releases/download/1.0.111/PassyCoreMSAL-1.0.111.xcframework.zip", checksum: "3ec6b833c5d88f6aef5207ab38f13bd77cc5cf725227c9ab7eca2e5a80a15487")
    ]
)
