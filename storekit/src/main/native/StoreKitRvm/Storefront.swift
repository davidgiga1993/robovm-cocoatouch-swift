import Foundation
import StoreKit

/// An App Store storefront.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
@objc public class RvmStorefront : NSObject {
    let raw: Storefront
    init (raw: Storefront) {
        self.raw = raw
    }

    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? Storefront {
            self.raw.countryCode == other.countryCode && self.raw.id == other.id
        } else { false }
    }

    public override var hash: Int { return raw.countryCode.hash * 1031 + raw.id.hash }

    /// The three-letter code representing the country or region associated with the App Store storefront.
    @objc public var countryCode: String { return raw.countryCode }

    /// A value defined by Apple that uniquely identifies an App Store storefront.
    @objc public var id: String { return raw.id }

    /// The current App Store storefront.
    @objc public static func current(completionHandler: @escaping (RvmStorefront?) -> Void) -> RvmTask {
        return Task.detached { completionHandler(await Storefront.current?.toRvm()) }.toRvm()
    }
}

// TODO: FIXME: AsyncSequence is not available yet 
//@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
//extension Storefront {
//
//    public struct Storefronts : AsyncSequence, Sendable {
//
//        /// The type of element produced by this asynchronous sequence.
//        public typealias Element = Storefront
//
//        /// The type of asynchronous iterator that produces elements of this
//        /// asynchronous sequence.
//        public struct AsyncIterator : AsyncIteratorProtocol {
//
//            /// Asynchronously advances to the next element and returns it, or ends the
//            /// sequence if there is no next element.
//            ///
//            /// - Returns: The next element, if it exists, or `nil` to signal the end of
//            ///   the sequence.
//            public mutating func next() async -> Storefront?
//
//            @available(iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, macOS 12.0, *)
//            public typealias Element = Storefront
//        }
//
//        /// Creates the asynchronous iterator that produces elements of this
//        /// asynchronous sequence.
//        ///
//        /// - Returns: An instance of the `AsyncIterator` type used to produce
//        /// elements of the asynchronous sequence.
//        public func makeAsyncIterator() -> Storefront.Storefronts.AsyncIterator
//    }
//
//    /// A sequence that emits a Storefront each time the App Store storefront changes.
//    public static var updates: Storefront.Storefronts { get }
//}

