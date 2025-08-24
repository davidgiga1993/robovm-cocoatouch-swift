package org.robovm.pods.cocoatouch.storekitrvm;


import org.robovm.apple.foundation.*;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.Block;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.objc.block.Block1;
import org.robovm.rt.bro.annotation.Library;
import org.robovm.rt.bro.annotation.MachineSizedSInt;
import org.robovm.rt.bro.ptr.Ptr;

@Library(Library.INTERNAL)
@NativeClass("StoreKitRvm.RvmPurchaseOption")
public class PurchaseOption extends NSObject {
    public static class PurchaseOptionPtr extends Ptr<PurchaseOption, PurchaseOptionPtr> {
    }

    static {
        ObjCRuntime.bind(PurchaseOption.class);
    }

    protected PurchaseOption() {
    }

    protected PurchaseOption(Handle h, long handle) {
        super(h, handle);
    }

    protected PurchaseOption(SkipInit skipInit) {
        super(skipInit);
    }

    @Property(selector = "debugDescription")
    public native String getDebugDescription();

    @Method(selector = "appAccountToken:")
    public static native PurchaseOption appAccountToken(NSUUID token);

    @Method(selector = "customStringWithKey:value:")
    public static native PurchaseOption customString(String key, String value);

    @Method(selector = "customNumberWithKey:value:")
    public static native PurchaseOption customNumber(String key, double value);

    @Method(selector = "customBoolWithKey:value:")
    public static native PurchaseOption customBool(String key, boolean value);

    @Method(selector = "customDataWithKey:value:")
    public static native PurchaseOption customData(String key, NSData value);

    @Method(selector = "onStorefrontChangeWithShouldContinuePurchase:")
    public static native PurchaseOption onStorefrontChange(@Block Block1<Storefront, Boolean> shouldContinuePurchase);

    @Method(selector = "promotionalOfferWithOfferID:keyID:nonce:signature:timestamp:")
    public static native PurchaseOption promotionalOffer(String offerID, String keyID, NSUUID nonce, NSData signature, @MachineSizedSInt long timestamp);

    /**
     * @since Available in iOS 17.4 and later.
     */
    @Method(selector = "promotionalOfferWithOfferID:signature:")
    public static native PurchaseOption promotionalOffer(String offerID, Product.SubscriptionInfo.Signature signature);

    @Method(selector = "quantity:")
    public static native PurchaseOption quantity(@MachineSizedSInt long quantity);

    @Method(selector = "simulatesAskToBuyInSandbox:")
    public static native PurchaseOption simulatesAskToBuyInSandbox(boolean simulateAskToBuy);

    /**
     * @since Available in iOS 18.0 and later.
     */
    @Method(selector = "winBackOffer:")
    public static native PurchaseOption winBackOffer(Product.SubscriptionOffer offer);
}