import StoreKit

//
// MARK: Product related converters
//

extension Product.PurchaseOption {
    func toRvm() -> RvmProduct.PurchaseOption { return RvmProduct.PurchaseOption(raw: self) }
}

extension Product.PurchaseResult {
    func toRvm() -> RvmProduct.PurchaseResult {
        return switch self {
        case .success(let verificationResult): RvmProduct.PurchaseResult.success(transaction: VerificationResultTransaction(raw: verificationResult))
        case .userCancelled: RvmProduct.PurchaseResult.userCancelled
        case .pending: RvmProduct.PurchaseResult.pending
        @unknown default: RvmProduct.PurchaseResult.unknown
        }
    }
}

extension Product.PurchaseError {
    func toRvm() -> NSError {
        let code = switch self {
            
        case .invalidQuantity: RvmProduct.PurchaseError.invalidQuantity.rawValue
        case .productUnavailable: RvmProduct.PurchaseError.productUnavailable.rawValue
        case .purchaseNotAllowed: RvmProduct.PurchaseError.purchaseNotAllowed.rawValue
        case .ineligibleForOffer: RvmProduct.PurchaseError.ineligibleForOffer.rawValue
        case .invalidOfferIdentifier: RvmProduct.PurchaseError.invalidOfferIdentifier.rawValue
        case .invalidOfferPrice: RvmProduct.PurchaseError.invalidOfferPrice.rawValue
        case .invalidOfferSignature: RvmProduct.PurchaseError.invalidOfferSignature.rawValue
        case .missingOfferParameters: RvmProduct.PurchaseError.missingOfferParameters.rawValue
        @unknown default: RvmProduct.PurchaseError.unknown.rawValue
        }
        
        return NSError(domain: RvmProduct.PurchaseErrorDomain, code: code)
    }
}

extension Product.SubscriptionInfo {
    func toRvm() -> RvmProduct.SubscriptionInfo { return RvmProduct.SubscriptionInfo(raw: self) }
}

extension Product.SubscriptionOffer {
    func toRvm() -> RvmProduct.SubscriptionOffer { return RvmProduct.SubscriptionOffer(raw: self) }
}

extension RvmProduct.SubscriptionOffer {
    func toRaw() -> Product.SubscriptionOffer { return self.raw }
}

extension Product.SubscriptionOffer.OfferType {
    func toRvm() -> RvmProduct.SubscriptionOffer.OfferType { return RvmProduct.SubscriptionOffer.OfferType(raw: self) }
}

extension Product.SubscriptionOffer.PaymentMode {
    func toRvm() -> RvmProduct.SubscriptionOffer.PaymentMode { return RvmProduct.SubscriptionOffer.PaymentMode(raw: self) }
}

extension Product.SubscriptionPeriod.Unit.FormatStyle {
    func toRvm() -> RvmProduct.SubscriptionPeriod.Unit.FormatStyle { return RvmProduct.SubscriptionPeriod.Unit.FormatStyle(raw: self) }
}


extension Product {
    func toRvm() -> RvmProduct { return RvmProduct(raw: self) }
}

extension Product.ProductType {
    func toRvm() -> RvmProduct.ProductType { return RvmProduct.ProductType(raw: self) }
}

extension Product.SubscriptionPeriod {
    func toRvm() -> RvmProduct.SubscriptionPeriod { return RvmProduct.SubscriptionPeriod(raw: self) }
}

extension Product.SubscriptionPeriod.Unit {
    func toRvm() -> RvmProduct.SubscriptionPeriod.Unit {
        switch self {
            case .day: return RvmProduct.SubscriptionPeriod.Unit.day
            case .week: return RvmProduct.SubscriptionPeriod.Unit.week
            case .month: return RvmProduct.SubscriptionPeriod.Unit.month
            case .year: return RvmProduct.SubscriptionPeriod.Unit.year
            @unknown default: return RvmProduct.SubscriptionPeriod.Unit.unknown
        }
    }
}

extension RvmProduct.SubscriptionPeriod.Unit {
    func toRaw() -> Product.SubscriptionPeriod.Unit {
        return switch self {
        case .day: Product.SubscriptionPeriod.Unit.day
        case .week: Product.SubscriptionPeriod.Unit.week
        case .month: Product.SubscriptionPeriod.Unit.month
        case .year: Product.SubscriptionPeriod.Unit.year
        case .unknown: Product.SubscriptionPeriod.Unit.day // SHOULD NOT HAPPEN
        }
    }
}


extension Product.PromotionInfo {
    func toRvm() -> RvmProduct.PromotionInfo { return RvmProduct.PromotionInfo(raw: self) }
}

extension Product.PromotionInfo.Visibility {
    func toRvm() -> RvmProduct.PromotionInfo.Visibility {
        switch self {
            case .appStoreConnectDefault: return RvmProduct.PromotionInfo.Visibility.appStoreConnectDefault
            case .visible: return RvmProduct.PromotionInfo.Visibility.visible
            case .hidden: return RvmProduct.PromotionInfo.Visibility.hidden
            @unknown default: return RvmProduct.PromotionInfo.Visibility.unknown
        }
    }
}

extension RvmProduct.PromotionInfo.Visibility {
    func toRaw() throws -> Product.PromotionInfo.Visibility {
        switch self {
            case .appStoreConnectDefault: return Product.PromotionInfo.Visibility.appStoreConnectDefault
            case .visible: return Product.PromotionInfo.Visibility.visible
            case .hidden: return Product.PromotionInfo.Visibility.hidden
            case .unknown: throw fatalError()
        }
    }
}

extension Product.SubscriptionInfo.RenewalState {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalState { return RvmProduct.SubscriptionInfo.RenewalState(raw: self) }
}

extension Product.SubscriptionInfo.RenewalInfo {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalInfo { return RvmProduct.SubscriptionInfo.RenewalInfo(raw: self) }
}

extension Product.SubscriptionInfo.RenewalInfo.ExpirationReason {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason { return RvmProduct.SubscriptionInfo.RenewalInfo.ExpirationReason(raw: self) }
}

extension Product.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus {
    func toRvm() -> RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus {
         return switch self {
         case .noIncreasePending: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.noIncreasePending
         case .pending: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.pending
         case .agreed: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.agreed
         @unknown default: RvmProduct.SubscriptionInfo.RenewalInfo.PriceIncreaseStatus.unknown
         }
    }
}

extension Product.SubscriptionInfo.Status {
    func toRvm() -> RvmProduct.SubscriptionInfo.Status { return RvmProduct.SubscriptionInfo.Status(raw: self) }
}

extension VerificationResult<Product.SubscriptionInfo.RenewalInfo> {
    func toRvm() -> VerificationResultRenewalInfo { return VerificationResultRenewalInfo(raw: self) }
}

extension Product.SubscriptionInfo.Status.Statuses {
    func toRvm() -> RvmAsyncSequence<RvmProduct.SubscriptionInfo.Status> { self.toRvm { $0?.toRvm() } }
}

extension AsyncStream<(groupID: String, statuses: [Product.SubscriptionInfo.Status])> {
    func toRvm() -> RvmAsyncSequence<RvmProduct.SubscriptionInfo.Status.Pair> {
        return self.toRvm {
            guard let (groupID, statuses) = $0 else { return  nil }
            return RvmProduct.SubscriptionInfo.Status.Pair(groupID: groupID, statuses: statuses.map{ $0.toRvm() })
        }
    }
}

//
// MARK: Transaction related converters
//

extension Transaction.RefundRequestError {
    func toRvm() -> NSError {
        let code = switch self {
            case .duplicateRequest: RvmTransaction.RefundRequestError.duplicateRequest.rawValue
            case .failed: RvmTransaction.RefundRequestError.failed.rawValue
            @unknown default: RvmTransaction.RefundRequestError.unknown.rawValue
        }
        return NSError(domain: RvmTransaction.RefundRequestErrorDomain, code: code)
    }
}

extension Transaction.RefundRequestStatus {
    func toRvm() -> RvmTransaction.RefundRequestStatus {
        switch self {
        case .success: return RvmTransaction.RefundRequestStatus.success
        case .userCancelled: return RvmTransaction.RefundRequestStatus.userCancelled
        @unknown default: return RvmTransaction.RefundRequestStatus.unknown
        }
    }
}

extension Transaction.Reason {
    func toRvm() -> RvmTransaction.Reason { return RvmTransaction.Reason(raw: self) }
}

extension Transaction.RevocationReason {
    func toRvm() -> RvmTransaction.RevocationReason { return RvmTransaction.RevocationReason(raw: self) }
}

extension Transaction.Offer {
    func toRvm() -> RvmTransaction.Offer { return RvmTransaction.Offer(raw: self) }
}

extension Transaction.OfferType {
    func toRvm() -> RvmTransaction.OfferType { return RvmTransaction.OfferType(raw: self) }
}

extension Transaction.OwnershipType {
    func toRvm() -> RvmTransaction.OwnershipType { return RvmTransaction.OwnershipType(raw: self) }
}

extension Transaction.Offer.PaymentMode {
    func toRvm() -> RvmTransaction.Offer.PaymentMode { return RvmTransaction.Offer.PaymentMode(raw: self) }
}

extension Transaction {
    func toRvm() -> RvmTransaction { return RvmTransaction(raw: self) }
}

extension VerificationResult<Transaction> {
    func toRvm() -> VerificationResultTransaction { return VerificationResultTransaction(raw: self) }
}

extension Transaction.Transactions {
    func toRvm() -> RvmAsyncSequence<VerificationResultTransaction> { return self.toRvm { $0?.toRvm() } }
}

//
// MARK: VerificationResult related converters
//

extension VerificationResult.VerificationError{
    func toRvmCode() -> Int {
        return switch self {
        case .revokedCertificate: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidCertificateChain: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidDeviceVerification: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidEncoding: VerificationErrorCode.revokedCertificate.rawValue
        case .invalidSignature: VerificationErrorCode.revokedCertificate.rawValue
        case .missingRequiredProperties: VerificationErrorCode.revokedCertificate.rawValue
        @unknown default:
            VerificationErrorCode.unknown.rawValue
        }
    }
    
    func toRvm() -> NSError { return NSError(domain: VerificationErrorDomainRvm, code: toRvmCode()) }
}


//
// MARK: Storefront related converters
//
extension Storefront {
    func toRvm() -> RvmStorefront { return RvmStorefront(raw: self) }
}

extension Storefront.Storefronts {
    func toRvm() -> RvmAsyncSequence<RvmStorefront> { self.toRvm { $0?.toRvm() } }
}

//
// MARK: PaymentMethodBinding related converters
//
extension PaymentMethodBinding.PaymentMethodBindingError {
    func toRvmCode() -> Int {
        switch self {
        case .notEligible: return RvmPaymentMethodBinding.PaymentMethodBindingError.notEligible.rawValue
        case .invalidPinningID: return RvmPaymentMethodBinding.PaymentMethodBindingError.invalidPinningID.rawValue
        case .failed: return RvmPaymentMethodBinding.PaymentMethodBindingError.failed.rawValue
        @unknown default:
            return RvmPaymentMethodBinding.PaymentMethodBindingError.unknown.rawValue
        }
    }
    
    func toRvm() -> NSError {
        return NSError(domain: RvmPaymentMethodBinding.PaymentMethodBindingErrorDomainRvm, code: toRvmCode())
    }

}


//
// MARK: PaymentMethodBinding related converters
//
extension Message {
    func toRvm() -> RvmMessage { RvmMessage(raw: self) }
}

extension Message.Reason {
    func toRvm() -> RvmMessage.Reason { RvmMessage.Reason(raw: self) }
}

extension Message.Messages {
    func toRvm() -> RvmAsyncSequence<RvmMessage> { self.toRvm { $0?.toRvm() } }
}


//
// MARK: ExternalPurchaseCustomLink related converters
//
extension RvmExternalPurchaseCustomLink.NoticeType {
    func toRaw() throws -> ExternalPurchaseCustomLink.NoticeType {
        switch self {
        case .unknown:
            throw fatalError()
        case .withinApp:
            return ExternalPurchaseCustomLink.NoticeType.withinApp
        case .browser:
            return ExternalPurchaseCustomLink.NoticeType.browser
        }
    }
}

extension ExternalPurchaseCustomLink.NoticeResult {
    func toRvm() -> RvmExternalPurchaseCustomLink.NoticeResult {
        switch self {
            case .cancelled: return RvmExternalPurchaseCustomLink.NoticeResult.cancelled
            case .continued: return RvmExternalPurchaseCustomLink.NoticeResult.continued
            @unknown default: return RvmExternalPurchaseCustomLink.NoticeResult.unknown
        }
    }
}


extension ExternalPurchaseCustomLink.Token {
    func toRvm() -> RvmExternalPurchaseCustomLink.Token {
        return RvmExternalPurchaseCustomLink.Token(raw: self)
    }
}


//
// MARK: ExternalPurchase related converters
//
extension ExternalPurchase.NoticeResult {
    func toRvm() -> RvmExternalPurchase.NoticeResult {
        switch self {
        case .continuedWithExternalPurchaseToken(let token):
            return RvmExternalPurchase.NoticeResult.Continued(externalPurchaseToken: token)
        case .cancelled:
            return RvmExternalPurchase.NoticeResult.canceled
        default:
            return RvmExternalPurchase.NoticeResult.canceled
        }
    }
}


//
// MARK: AppStore related converters
//
extension AppStore.Environment {
    func toRvm() -> RvmAppStore.Environment { RvmAppStore.Environment(raw: self) }
}


//
// MARK: PurchaseIntent
//
extension PurchaseIntent {
    func toRvm() -> RvmPurchaseIntent { RvmPurchaseIntent(raw: self) }
}

extension PurchaseIntent.PurchaseIntents {
    func toRvm() -> RvmAsyncSequence<RvmPurchaseIntent> { self.toRvm { $0?.toRvm() } }
}

