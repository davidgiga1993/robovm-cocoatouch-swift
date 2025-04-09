import Foundation
import StoreKit


/// A message to be displayed.
@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@objc public class RvmMessage : NSObject {
    let raw: Message
    init(raw: Message) {
        self.raw = raw
    }

    public override func isEqual(_ object: Any?) -> Bool {
        return if let other = object as? RvmMessage { self.raw == other.raw } else { false }
    }

    public override var hash: Int { return raw.hashValue }

    /// The reason for the message.
    @objc public var reason: RvmMessage.Reason { return raw.reason.toRvm() }

    @available(iOS 16.0, visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @objc(RvmMessage_Reason)
    public class Reason : NSObject {
        let raw: Message.Reason
        init(raw: Message.Reason) {
            self.raw = raw
        }
        
        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Reason { self.raw == other.raw } else { false }
        }

        public override var hash: Int { return raw.hashValue }


        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        @objc public var rawValue: Int { return raw.rawValue }

        @objc public static var generic: RvmMessage.Reason { return Message.Reason.generic.toRvm() }

        @objc  public static var priceIncreaseConsent: RvmMessage.Reason { return Message.Reason.priceIncreaseConsent.toRvm() }

        @available(iOS 16.4, visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @objc public static var billingIssue: RvmMessage.Reason { return Message.Reason.billingIssue.toRvm() }

        @available(iOS 18.0, visionOS 2.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @objc public static var winBackOffer: RvmMessage.Reason { return Message.Reason.winBackOffer.toRvm() }
    }
}



@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension RvmMessage {

    /// Asks the system to display the message.
    /// - Throws: A `StoreKitError`
    @objc @MainActor public func display(in scene: UIWindowScene) throws {
        try raw.display(in: scene)
    }
}

///
///  FIXME: TODO: AsyncSequence if required
///
//@available(iOS 16.0, visionOS 1.0, *)
//@available(macOS, unavailable)
//@available(tvOS, unavailable)
//@available(watchOS, unavailable)
//extension Message {
//
//    /// An asynchronous sequence of pending messages to be displayed.
//    public struct Messages : AsyncSequence, Sendable {
//
//        /// The type of element produced by this asynchronous sequence.
//        public typealias Element = Message
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
//            public mutating func next() async -> Message.Messages.Element?
//
//            @available(iOS 16.0, visionOS 1.0, *)
//            @available(tvOS, unavailable)
//            @available(watchOS, unavailable)
//            @available(macOS, unavailable)
//            public typealias Element = Message.Messages.Element
//        }
//
//        /// Creates the asynchronous iterator that produces elements of this
//        /// asynchronous sequence.
//        ///
//        /// - Returns: An instance of the `AsyncIterator` type used to produce
//        /// elements of the asynchronous sequence.
//        public func makeAsyncIterator() -> Message.Messages.AsyncIterator
//    }
//
//    /// Use `messages` to listen for pending messages. You may want to delay
//    /// showing the message if it would interrupt your user's interaction
//    /// with your app. By default, the system will display pending
//    /// messages at app launch.
//    public static var messages: Message.Messages { get }
//}

@available(iOS 16.0, visionOS 1.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension RvmMessage.Reason {
    @objc public override var description: String { return raw.localizedDescription }
}

