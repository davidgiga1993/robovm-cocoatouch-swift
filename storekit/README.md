# CocoaTouch bindings for StoreKit2 api
[**MobiVM**](https://github.com/MobiVM/robovm) -
[**bro-gen**](https://github.com/dkimitsa/robovm-bro-gen) -
[**bro-gen tutorial**](https://dkimitsa.github.io/2017/10/19/bro-gen-tutorial/) -
[**dkimitsa's dev blog**](https://dkimitsa.github.io/)

Repository contains bindings for StoreKit API v18.2 accessible by Swift code only (known as StoreKit2).   
https://developer.apple.com/storekit/  
https://developer.apple.com/documentation/storekit

## How to use 
Library is deployed to Sonatype snapshot repository and all-inclusive (contains native wrapper framework and bindings). 
Add repository and dependency to `build.gradle`:
```groovy
repositories {
    maven { url 'https://oss.sonatype.org/content/repositories/snapshots' }
}
dependencies {
    implementation "io.github.dkimitsa.robovm:robopods-storekit-swift:18.2.0.1-SNAPSHOT"
}
```

Use API similar as per Apple docs:   
Java:
```Java
Product.getProducts(NSArray.fromStrings("product.id.1"), (products, nsError) -> {
    if (nsError != null) {
        // handle error
        return;
    }
    // handle products
});
```
or kotlin:
```kotlin
scope.launch(Dispatchers.Main) {
    try {
        val storeProducts = ProductKt.getProducts(listOf("product.id.1"))
    } catch(e: NSErrorException) {
        e.printStackTrace()
    }
}
```

## Sample app
The port of [Apple's Implementing a store in your app using the StoreKit API](https://developer.apple.com/documentation/storekit/implementing-a-store-in-your-app-using-the-storekit-api) available as part of [alt-pods-tests](https://github.com/dkimitsa/alt-pods-tests) repository:  
https://github.com/dkimitsa/alt-pods-tests/tree/master/cocoatouch-swift-storekit

## Kotlin notes
Kotlin extensions were added to Java classes that turns most of the functions with callbacks into suspendable. This allows to use API as designed by Apple as StoreKit2 is written with idea of structured concurrency.
As kotlin can't add `Companion` to Java classes to extend these with static methods, following objects were introduced and extensions added to them:
```kotlin
object AppStoreKt
object ProductKt {
    object PromotionInfoKt
    object SubscriptionInfoKt
}
object TransactionKt
object AppTransactionKt
object ExternalLinkAccountKt
object ExternalPurchaseKt
object ExternalPurchaseCustomLinkKt
object ExternalPurchaseLinkKt
object PaymentMethodBindingKt
object StorefrontKt
```

example: 
```kotlin
/**
 * @since Available in iOS 16.0 and later.
 * @throws org.robovm.apple.foundation.NSErrorException
 */
suspend fun AppStoreKt.presentOfferCodeRedeemSheet(scene: UIWindowScene) = suspendCancellableTask { cont ->
    AppStore.presentOfferCodeRedeemSheet(scene, cont::completionHandler)
}
```

WARNING: suspendable functions are not returning NSError object but will throw corresponding exception, make sure to handle these.


## Background 
RoboVM can access external/native libraries either by using bro-bridge. ObjectiveC interoperability is possible using [ObjectiveC Runtime](https://developer.apple.com/documentation/objectivec/objective-c_runtime?language=objc) while there is no such for swift.  
Neighbours are in same situations:  

[Kotlin](https://kotlinlang.org/docs/native-objc-interop.html#usage):
> A Swift library can be used in Kotlin code if its API is exported to Objective-C with @objc. Pure Swift modules are not yet supported.

[Xamarin](https://learn.microsoft.com/en-us/previous-versions/xamarin/ios/platform/binding-swift/walkthrough)
> If the header doesn't exist or has an incomplete public interface (for example, you don't see classes/members) you have two options:
> -Update the Swift source code to generate the header and mark the required members with @objc attribute
> - Build a proxy framework where you control the public interface and proxy all the calls to underlying framework

## Implementation
StoreKit -> StoreKitRvm -> StoreKitRvm.java-raw -> StoreKitRvm.java -> StoreKitRvm.kotlin

### build from sources
maven and xcode is required.  
should be build as simple as `mvn clean install`.  
it will build `StoreKitRvm.xcframework`, copy it to res folder and install artifact into maven-local.

### StoreKitRvm
To make StoreKit2 accessible it has to be wrapper into `ObjectiveC` wrappers at native level. Implemented as `StoreKitRvm.xcframework`.  
[Source code](src/main/native/) to be build using [build.sh](src/main/native/build.sh):
- `build.sh` without arguments will keep `Headers` folder required for building `StoreKitRvm.java-raw`;
- `build.sh -strip` will strip `Headers` and `Modules` folder to reduce the footprint.

### StoreKitRvm.java-raw
Native ObjectiveC `StoreKitRvm.xcframework` to be bind into Java api using `bro-gen`, following command line to be run in `storekit/src/main/bro-gen` location:  
> ${path_to_bro_gen}/bro-gen.rb ../java.raw storekitrvm.yaml

Result is a Java code in `src/main/java.raw`. Bro-gen has limitations and can't produce internal class hierarchy thus result of bro-gen is used as raw code that then manually produced in proper structure. 
For example:
```java
public class RvmProduct_SubscriptionInfo_RenewalInfo_ExpirationReason {
    
} 

// into 
public class Product {
    public static class SubscriptionInfo {
        public static class RenewalInfo {
            public static class ExpirationReason {

            }
        }
    }
}
```

This allows to have hierarchy similar to original swift StoreKit. 

Another purpose of `java.raw` is observe changes in it and apply to final manual `java` when changes in `StoreKitRvm.xcframework` are introduced and re-binds is performed.

### StoreKitRvm.java
Manually structured and cleaned up code from `java.raw`. This code is compiled into artifact and used as API. 

### StoreKitRvm.kotlin
Useful kotlin flavour extensions to `StoreKitRvm.java`, mostly converts based callback api into suspendable. As Swift `StoreKit` is built with structured concurrency in mind and usage scenarios means sequences of async calls to be done.   
Usage of callback APIs will result into hierarchy of callback handlers that makes code messy.  
Suspendable coroutines makes possible to write concurrent code very close to original one. 

Check [sample app]() 
