//
//  FormatStyle.swift
//  StoreKitRvm
//

import Foundation
import CryptoKit

@objc public class RvmFormatStyle_Currency: NSObject {
    let raw: Decimal.FormatStyle.Currency
    init(raw: Decimal.FormatStyle.Currency) {
        self.raw = raw
    }
    
    @objc public var currencyCode: String { return raw.currencyCode }
    @objc public var locale: Locale { return raw.locale }
    
}

extension Decimal.FormatStyle.Currency {
    func toRvm() -> RvmFormatStyle_Currency { return RvmFormatStyle_Currency(raw: self) }
}
