/*
 * Copyright (C) 2013-2015 RoboVM AB
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.robovm.pods.cocoatouch.storekitrvm;

/*<imports>*/
import java.io.*;
import java.nio.*;
import java.util.*;
import org.robovm.objc.*;
import org.robovm.objc.annotation.*;
import org.robovm.objc.block.*;
import org.robovm.rt.*;
import org.robovm.rt.annotation.*;
import org.robovm.rt.bro.*;
import org.robovm.rt.bro.annotation.*;
import org.robovm.rt.bro.ptr.*;
import org.robovm.apple.foundation.*;
import org.robovm.apple.uikit.*;
import org.robovm.apple.coregraphics.*;
import org.robovm.apple.coreanimation.*;
/*</imports>*/

/*<javadoc>*/
/**
 * @since Available in iOS 16.4 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmPurchaseIntent")/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmPurchaseIntent/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmPurchaseIntentPtr extends Ptr<RvmPurchaseIntent, RvmPurchaseIntentPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmPurchaseIntent.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmPurchaseIntent() {}
    protected RvmPurchaseIntent(Handle h, long handle) { super(h, handle); }
    protected RvmPurchaseIntent(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "product")
    public native RvmProduct getProduct();
    /**
     * @since Available in iOS 18.0 and later.
     */
    @Property(selector = "offer")
    public native RvmProduct_SubscriptionOffer getOffer();
    @Property(selector = "id")
    public native String getId();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "intents")
    public static native RvmAsyncSequence<RvmPurchaseIntent> intents();
    /*</methods>*/
}
