//
//  ECDSASignature.swift
//  StoreKitRvm
//

import Foundation
import CryptoKit

@objc public class RvmECDSASignature: NSObject {
    let raw: P256.Signing.ECDSASignature
    init(raw: P256.Signing.ECDSASignature) {
        self.raw = raw
    }
    
    /// A raw data representation of a P-256 digital signature.
    @objc public var rawRepresentation: Data { raw.rawRepresentation }
    
    /// A Distinguished Encoding Rules (DER) encoded representation of a
    /// P-256 digital signature.
    @objc public var derRepresentation: Data { raw.derRepresentation }

}

extension P256.Signing.ECDSASignature {
    func toRvm() -> RvmECDSASignature { return RvmECDSASignature(raw: self) }
}
