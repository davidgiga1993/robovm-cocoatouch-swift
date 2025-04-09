import Foundation
import StoreKit


extension RvmAppStore {
    @objc(RvmAppStore_Environment)
    public class Environment: NSObject {
        let raw: AppStore.Environment
        init(raw: AppStore.Environment) { self.raw = raw }

        public override func isEqual(_ object: Any?) -> Bool {
            return if let other = object as? Environment { self.raw == other.raw } else { false }
        }

        public override var hash: Int { return raw.hashValue }

        @objc public var rawValue: String { return raw.rawValue }

        /// The environment for apps downloaded from the App Store.
        @objc public static var production: Environment { return AppStore.Environment.production.toRvm() }

        /// The environment for the App Store Sandbox or apps downloaded from TestFlight.
        @objc public static var sandbox: Environment { return AppStore.Environment.sandbox.toRvm() }

        /// The environment for StoreKit Testing in Xcode, including unit tests with StoreKitTest.
        @objc public static var xcode: Environment { return AppStore.Environment.xcode.toRvm() }
        
        public override var description: String { return raw.rawValue}
    }
}

