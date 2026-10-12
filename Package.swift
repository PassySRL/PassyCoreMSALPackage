// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PassyCoreMSALPackage",
    platforms: [.iOS("15.6")],
    products: [
        .library(name: "PassyCoreMSAL",
                 targets: ["PassyCoreMSALDependencies"])
    ],
    dependencies: [
        .package(url: "https://github.com/PassySRL/PassyCorePackage.git", exact: "1.0.38"),
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
                      url: "https://github.com/PassySRL/PassyCoreMSALPackage/releases/download/1.0.112/PassyCoreMSAL-1.0.112.xcframework.zip", checksum: "7f2d68489079a343c2088385d70ff8e7e156e1d86f769b50c5224b228952674b")
    ]
)
