import Foundation
import StoreKit

/// Information about a product configured in App Store Connect.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc public class RvmPurchaseOption: NSObject  {
	let raw: Product.PurchaseOption
	init(raw: Product.PurchaseOption) {
		self.raw = raw
	}

	public override func isEqual(_ object: Any?) -> Bool {
		return if let other = object as? RvmPurchaseOption { self.raw == other.raw } else { false }
	}

	public override var hash: Int { raw.hashValue }

	/// Apply an app account token to a purchase.
	///
	/// The app account token will persist in the resulting `Transaction` from a purchase.
	/// - Parameter token: A UUID that associates the purchase with an account in your system.
	@objc public static func appAccountToken(_ token: UUID) -> RvmPurchaseOption {
		return Product.PurchaseOption.appAccountToken(token).toRvm()
	}

	/// Add a custom string option to a purchase.
	/// - Parameters:
	///   - key: The key for this custom option.
	///   - value: The value for this custom option.
	@objc public static func customString(key: String, value: String) -> RvmPurchaseOption {
		return Product.PurchaseOption.custom(key: key, value: value).toRvm()
	}

	/// Add a custom number option to a purchase.
	/// - Parameters:
	///   - key: The key for this custom option.
	///   - value: The value for this custom option.
	@objc public static func customNumber(key: String, value: Double) -> RvmPurchaseOption {
		return Product.PurchaseOption.custom(key: key, value: value).toRvm()
	}

	/// Add a custom Boolean option to a purchase.
	/// - Parameters:
	///   - key: The key for this custom option.
	///   - value: The value for this custom option.
	@objc public static func customBool(key: String, value: Bool) -> RvmPurchaseOption {
		return Product.PurchaseOption.custom(key: key, value: value).toRvm()
	}

	/// Add a custom data option to a purchase.
	/// - Parameters:
	///   - key: The key for this custom option.
	///   - value: The value for this custom option.
	@objc public static func customData(key: String, value: Data) -> RvmPurchaseOption {
		return Product.PurchaseOption.custom(key: key, value: value).toRvm()
	}

	/// A closure that determines whether the transaction should continue if the device's App Store storefront has changed during a transaction.
	///
	/// The default is `true` if this option is not added.
	/// - Parameter shouldContinuePurchase: A closure that returns a boolean to determine if the
	///                                     purchase should continue when the storefront has
	///                                     changed to `Storefront` during the purchase process.
	@objc @preconcurrency public static func onStorefrontChange(shouldContinuePurchase: @escaping @Sendable (RvmStorefront) -> Bool) -> RvmPurchaseOption {
		let proxy: @Sendable (Storefront) -> Bool = { shouldContinuePurchase($0.toRvm()) }
		return Product.PurchaseOption.onStorefrontChange(shouldContinuePurchase: proxy).toRvm()
	}

	/// Apply a promotional offer to a purchase.
	/// - Parameters:
	///   - offerID: The `id` property of the `SubscriptionOffer` to apply.
	///   - keyID: The key ID of the private key used to generate `signature`. The private key
	///            and key ID can be generated on App Store Connect.
	///   - nonce: The nonce used in `signature`.
	///   - signature: The cryptographic signature of the offer parameters, generated on your
	///                server.
	///   - timestamp: The time the signature was generated in milliseconds since 1970.
	@objc public static func promotionalOffer(offerID: String, keyID: String, nonce: UUID, signature: Data, timestamp: Int) -> RvmPurchaseOption {
		return Product.PurchaseOption.promotionalOffer(offerID: offerID, keyID: keyID, nonce: nonce, signature: signature, timestamp: timestamp).toRvm()
	}

	/// Apply a promotional offer to a purchase.
	///
	/// - Parameters:
	///    - offerID: The `id` property of the `SubscriptionOffer` to apply.
	///    - signature: The metadata of the signature used to validate a promotional offer.
	@available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, visionOS 1.1, *)
	@objc public static func promotionalOffer(offerID: String, signature: RvmProduct.SubscriptionOffer.Signature) -> RvmPurchaseOption {
		return Product.PurchaseOption.promotionalOffer(offerID: offerID, signature: signature.raw).toRvm()
	}

	/// The quantity of this product to purchase.
	///
	/// The default is 1 if this option is not added. This option can only be applied to consumable
	/// products and non-renewing subscriptions.
	/// - Parameter quantity: The quantity to purchase.
	@objc public static func quantity(_ quantity: Int) -> RvmPurchaseOption {
		return Product.PurchaseOption.quantity(quantity).toRvm()
	}

	/// Toggle ask to buy when testing in the App Store Sandbox environment.
	///
	/// The default is `false` if this option is not added.
	/// - Parameter simulateAskToBuy: Set as `true` to simulate a child's account asking
	///                               permission to purchase from a family member.
	@objc public static func simulatesAskToBuyInSandbox(_ simulateAskToBuy: Bool) -> RvmPurchaseOption {
		return Product.PurchaseOption.simulatesAskToBuyInSandbox(simulateAskToBuy).toRvm()
	}

	/// Apply a win-back offer to a purchase.
	/// - Parameters:
	///   - offer: The `SubscriptionOffer` of type win-back to apply to the purchase.
	@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
	@objc public static func winBackOffer(_ offer: RvmProduct.SubscriptionOffer) -> RvmPurchaseOption {
		return Product.PurchaseOption.winBackOffer(offer.toRaw()).toRvm()
	}
}