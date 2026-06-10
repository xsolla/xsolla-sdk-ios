# Xsolla Mobile SDK for iOS

[![License](https://img.shields.io/github/license/xsolla/xsolla-sdk-ios)](./LICENSE)
[![Swift 5+](https://img.shields.io/badge/Swift-5+-orange.svg)](https://swift.org)
[![iOS 12+](https://img.shields.io/badge/iOS-12%2B-blue.svg)](https://developer.apple.com)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)

## Overview

Xsolla Mobile SDK for iOS is a pre-built SDK for integrating in-game payments into your app via Xsolla Pay Station. It provides a StoreKit-compatible API (`SKPaymentQueue`, `SKProduct`, `SKPaymentTransaction`) so integration feels familiar to iOS developers.

**Key features:**

- 1000+ payment methods across 200+ geographies
- 130+ currencies, including local and alternative payment methods
- Built-in anti-fraud protection
- 25+ languages out of the box
- Player authentication (Xsolla Login widget, social login, custom tokens)
- Product catalog and virtual items
- Buy Button and Web Shop integration

Try the [interactive SDK Explorer](https://developers.xsolla.com/sdk/demo/) to see the payment flow before writing code.

## Requirements

- iOS 12.0+
- Xcode 16.4+
- Swift 5.9+

## Install

### Swift Package Manager (Xcode)

1. In Xcode: **File > Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/xsolla/xsolla-sdk-ios.git`
3. Select a version rule (e.g. **Up to Next Major Version**) and click **Add Package**

### Swift Package Manager (Package.swift)

```swift
dependencies: [
    .package(url: "https://github.com/xsolla/xsolla-sdk-ios.git", from: "3.8.0")
]
```

Then add the product to your target:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "XsollaMobileSDK", package: "xsolla-sdk-ios")
    ]
)
```

## Usage

```swift
import XsollaMobileSDK

// 1. Authenticate — configure, start the queue, register an observer
let settings = SKPaymentSettings(projectId: 301871,
                                 loginProjectId: "dfcb133b-6d0b-4937-b8d2-c4f4d58fb53a")
settings.useSandbox = true
SKPaymentQueue.default().start(settings)
SKPaymentQueue.default().add(self) // SKPaymentTransactionObserver

// 2. Load catalog by SKU
let request = SKProductsRequest(productIdentifiers: ["ticket.10", "pack.starter"])
request.delegate = self
request.start()

// 3. Purchase
let payment = SKPayment(product: products.first!)
SKPaymentQueue.default().add(payment)

// 4. Finalize completed transactions in your observer, then:
SKPaymentQueue.default().finishTransaction(transaction)
```

See the [SDK Documentation](https://developers.xsolla.com/sdk/) for the full integration guide.

## Documentation

- [SDK Documentation](https://developers.xsolla.com/sdk/) — full integration guide
- [SDK Explorer](https://developers.xsolla.com/sdk/demo/) — interactive demo
- [Demo App](https://github.com/xsolla/xsolla-sdk-demo) — sample project

## Support

- **GitHub Issues:** [github.com/xsolla/xsolla-sdk-ios/issues](https://github.com/xsolla/xsolla-sdk-ios/issues)
- **Integration team:** integration@xsolla.com
- **Developer portal:** [developers.xsolla.com](https://developers.xsolla.com)

## License

Apache License 2.0. See [LICENSE](./LICENSE).
