# Xsolla Mobile SDK for iOS

[![Swift 5+](https://img.shields.io/badge/Swift-5+-orange.svg)](https://swift.org)
[![iOS 12+](https://img.shields.io/badge/iOS-12%2B-blue.svg)](https://developer.apple.com)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)

Pre-built iOS SDK for integrating in-game payments into your app via Xsolla Pay Station.

## Essential Links

- [SDK Explorer](https://developers.xsolla.com/sdk/demo/) — interactive demo
- [SDK Documentation](https://developers.xsolla.com/sdk/) — full integration guide
- [Demo App](https://github.com/xsolla/xsolla-sdk-demo) — sample project

## Overview

Xsolla Mobile SDK provides a StoreKit-compatible API for in-game purchases via Xsolla Pay Station. It mirrors Apple's StoreKit patterns (`SKPaymentQueue`, `SKProduct`, `SKPaymentTransaction`) so integration feels familiar to iOS developers.

**Key features:**

- 1000+ payment methods across 200+ geographies
- 130+ currencies including local and alternative payment methods
- Built-in anti-fraud protection
- 25+ languages supported out of the box
- Player authentication (Xsolla Login widget, social login, custom tokens)
- Product catalog and virtual items
- Buy Button and Web Shop integration

## Requirements

- iOS 12.0+
- Xcode 16.4+
- Swift 5.9+

## Installation

### Swift Package Manager (Xcode)

1. In Xcode, go to **File > Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/xsolla/xsolla-sdk-ios.git
   ```
3. Select the version rule (e.g., **Up to Next Major Version**)
4. Click **Add Package**

### Swift Package Manager (Package.swift)

Add the dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/xsolla/xsolla-sdk-ios.git", from: "3.8.0")
]
```

Then add `"XsollaMobileSDK"` to your target's dependencies:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "XsollaMobileSDK", package: "xsolla-sdk-ios")
    ]
)
```

## Quick Start

### 1. Authenticate

Configure the SDK with your project credentials, start the payment queue, and register a transaction observer:

```swift
import XsollaMobileSDK

let settings = SKPaymentSettings(projectId: 301871,
                                 loginProjectId: "dfcb133b-6d0b-4937-b8d2-c4f4d58fb53a")

settings.useSandbox = true
settings.openExternalBrowser = true

SKPaymentQueue.default().start(settings)
SKPaymentQueue.default().add(self) // conforms to SKPaymentTransactionObserver
```

### 2. Load Catalog

Query your product catalog by SKU:

```swift
let skus: Set<String> = ["ticket.10", "ticket.20", "ticket.30", "pack.starter", "pack.premium", "pack.vip", "money.100", "money.200", "money.300"]
let request = SKProductsRequest(productIdentifiers: skus)
request.delegate = self
request.start()

// Conform to SKProductsRequestDelegate
extension YourClass: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
    }
}
```

### 3. Purchase

Use the product from your catalog to launch a purchase via Pay Station:

```swift
let product = products.first!
let payment = SKPayment(product: product)
SKPaymentQueue.default().add(payment)
```

### 4. Finalize

Handle completed transactions in your `SKPaymentTransactionObserver` and finish each one:

```swift
extension YourClass: SKPaymentTransactionObserver {
    func paymentQueue(_: SKPaymentQueue, updatedTransactions: [SKPaymentTransaction]) {
        for transaction in updatedTransactions {
            switch transaction.transactionState {
            case .purchased:
                // Award the product to the user
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                // Handle error
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
}
```

> For the full integration guide, see the [SDK Documentation](https://developers.xsolla.com/sdk/).
