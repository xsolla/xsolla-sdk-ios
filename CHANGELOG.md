# Changelog

All notable changes to this project will be documented in this file.

## [3.9.0] - 2026-04-02

### Added

- Added `restoreUnfinishedPurchases(completion:)` method to `SKPaymentQueue` to explicitly trigger purchase restoration with typed error reporting via `SKXRestorationError`.

### Fixed

- Fixed an issue where login tokens that contained embedded Xsolla Account tokens were not refreshing correctly.

## [3.8.0] - 2026-01-22

### Added

- Added `cancelTransaction()` method to `SKPaymentQueue` to cancel the currently active transaction and abort any ongoing payment processes.
- Added `retryPolicies` to `SKPaymentSettings` to configure retry behavior for network operations (authentication, order creation, status queries, etc.).

## [3.7.0] - 2026-01-19

### Added

- Added `setSocialProviderToken()` method to `SKPaymentSettings` for social account authentication.

## [3.6.0] - 2026-01-14

### Added

- Added support for custom Pay Station domains via `setupCustomPaystationDomain()` in `SKPaymentSettings`.

## [3.5.2] - 2026-01-07

### Fixed

- Fixed an issue where transactions completed in an external browser via deeplink could be missing the invoice identifier.

## [3.5.1] - 2026-01-06

### Fixed

- Improved reliability when forcing portrait orientation in landscape applications.

## [3.5.0] - 2025-12-29

### Added

- Added `visiblePaymentLogo` to `SKPaymentSettings` to control logo visibility in Pay Station header.

## [3.4.2] - 2025-12-23

### Added

- Web Shop link-outs now automatically append the `utm_content` parameter to the URL to ensure accurate analytics tracking.

## [3.4.1] - 2025-12-15

### Added

- Full support for Universal Links (https:// URLs) in addition to custom URL schemes for payment redirects and login callbacks.

### Fixed

- `collectPartnerEventEmailConsent` can now be set from Objective-C via the `collectPartnerEventEmailConsentValue` bridge.

## [3.4.0] - 2025-12-12

### Added

- Added additional error logging when items cannot be loaded due to missing prices.
- Added `fetchPersonalizedProducts` to `SKPaymentSettings` to load a personalized item catalog.
- Added `paymentQueueDidLogin(:)` to `SKPaymentTransactionObserver` to receive a callback when the SDK obtains a login token.

### Fixed

- Invoice identifier is now present in transactions that complete by closing the payment before the deeplink callback.
- Payments closed during processing no longer fail early; the SDK will retry fetching the updated status.

## [3.3.2] - 2025-12-09

### Changed

- Country code will now be passed as part of the payment token.

## [3.3.1] - 2025-12-02

### Fixed

- Fixed an issue where item restoration failed for items that were missing an image.

## [3.3.0] - 2025-11-21

### Added

- `SKPaymentTransactionObserver` now exposes `paymentQueue(_:event:for:)` plus an expanded `SKPaymentTransactionPaystationEvent` enum so Pay Station lifecycle can be tracked.

## [3.2.0] - 2025-11-13

### Added

- Added the `collectPartnerEventEmailConsent` flag to `SKPaymentSettings` for partners that use this functionality.

### Changed

- The `allowUsingContainerController` setting in `SKPaymentSettings` is now enabled only on iOS 26.

### Fixed

- Corrected an issue where the wrong invoice identifier was reported for purchases that initially failed but were later completed successfully.
- Fixed an issue where Pay Station orientation was incorrectly forced on iOS 26.

## [3.1.2] - 2025-11-03

### Fixed

- Resolved a rare decoding issue that caused `SKProductsRequest` to return an empty item list.

## [3.1.1] - 2025-10-28

### Added

- Token-only purchases can now override the project ID specified in `SKPaymentSettings`.

### Fixed

- The invoice identifier was missing in some successful purchase cases. It will now be included consistently.

## [3.1.0] - 2025-10-23

### Added

- New `TokenPayment` API and `SKPaymentQueue.purchase(with:)` for token-only purchases.

### Fixed

- Purchase no longer ends when `SFSafariViewController` begins closing but doesn’t fully close.
- `redirectButtonCaption` in `SKPaymentSettings` is now `nil` by default, ensuring it won’t override custom string values set in the Publisher Account.

## [3.0.5] - 2025-10-03

### Fixed

- Purchase finish deep links now validate the payment status to correctly fail problematic purchases.
- Completing a payment in an external browser now triggers purchase restoration if no active purchase is found.
- Validation of restored purchases won't fail.

## [3.0.4] - 2025-09-09

### Added

- When using Xsolla Events, updates can be polled and delivered continuously. `SKPaymentSettings` has an `eventsPollingInterval` to setup.

## [3.0.3] - 2025-09-05

### Fixed

- Payment cancellation now works correctly - cancelling a payment will properly complete as a cancellation instead of returning an error.
- Improved transaction restoration - successful purchases will now reliably finish transactions when restored via the Events API.

## [3.0.2] - 2025-09-02

### Fixed

- Setting only the Web Shop URL no longer routes all purchases to Web Shop. Use `purchase(withSKU:)` to explicitly start the Web Shop flow.
- Setting `customLoginToken` after initialization now re-fetches inventory and uses the updated token for subsequent purchases.

## [3.0.1] - 2025-08-14

### Changed

- Purchases started in an external browser are no longer cancelled immediately. They will now remain pending until the user returns to the app, and will be marked as successful if the payment was completed.


## [3.0.0] - 2025-08-14

### Added

- `SKPaymentSettings` has a `useEventsApiForPurchaseRestoration` to Xsolla Events for purchase restoration.
- `SKPaymentSettings` and `SKPayment` has a `paymentMethod` to set default Payment Method ID for the purchase.

## [2.3.3] - 2025-08-13

### Fixed

- Hang of purchases initiated by Pay Station token that were opened in external browser.

## [2.3.2] - 2025-08-05

### Fixed

- Web view not respecting supported orientation when allowed, if the current device orientation differs.
- Failure to complete transactions initiated via Pay Station token.
- Missing web distribution from the alternative distribution check.

## [2.3.1] - 2025-08-04

### Fixed

- Transactions initiated by the Pay Station token to fail when finishing.

### Changed

- Improved how `purchase(withPaystationToken:, isSandbox:)` works under the hood. Validation now works.

## [2.3.0] - 2025-07-09

### Added

- `SKPaymentSettings` has a `useBuyButtonSolution` to support Buy Button.
- `SKPayment` has a `externalIdentifier` for passing external identifiers to the payment.
- `SKPaymentSettings` has a `trackingId` that can be set and will be passed with each payment.
- Support for Web Shop mode and Buy Button.

### Fixed

- Fixed swizzling not working when using `UISceneDelegate` and its url handling.

## [2.2.1] - 2025-05-27

### Fixed

- Fixed compatibility with latest Xcode version 16.3.
- Empty custom params won't be added to the payment token.

### Added

- `AccessTokenInfo` now has a constructor to init it from the `XMAccessTokenInfo`

## [2.2.0] - 2025-05-07

The Xsolla Mobile SDK has been updated to ensure compliance with Apple’s revised App Store guidelines.

### Added

- Added `loadCurrentStorefrontCountryCode` function to `SKPaymentQueue` to determine current storefront's three-letter country code.

## [2.1.4] - 2025-02-26

### Added

- Added refresh widget token helper functions to `LoginManager`.

## [2.1.3] - 2025-02-24

### Added

- Added `dismissWebView` to `LoginManager` to close currently presented web view.
- Added `webViewDismissRedirectUrl` to `SKPaymentSettings` to handle a deep link which closes currently presented web view.

## [2.1.2] - 2025-02-12

### Changed

- Dropped all dependencies.

## [2.1.1] - 2024-11-20

### Added

- Added `openExternalBrowser` option to `SKPaymentSettings` to support opening payments in the external browser.
- Added `currentLoginToken` getter to `SKPaymentQueue` to get login token used by the Payments.
- Added `customPayload` to the `SKPayment` to send custom data along with the payment to be received in the payment webhook.

### Changed

- Using XsollaSDK 1.0.2
- `customUserId` from `SKPaymentSettings` will be sent to the custom params and received in the payment webhook.

## [2.1.0] - 2024-09-05

### Added

- Added support for authenticating using Xsolla Widget.
- Added support for opening `SFSafariViewController` with a specified URL and orientation.

## [2.0.1] - 2024-09-03

### Added

- Bundle Id used as a return url scheme by default.
- `SKPaymentQueue` has `checkIfAvailable` function to determine if alternative payments can be used.
- `enablePayments` setting to completely enable or disable the SDK.
- Network requests will be retried few times before failing.

### Changed

- Simplified settings constructor for better Obj-C support.

## [2.0.0] - 2024-05-31

- Initial release.
