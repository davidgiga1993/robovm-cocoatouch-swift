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
 * @since Available in iOS 16.0 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmMessage_Reason/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmMessage_ReasonPtr extends Ptr<RvmMessage_Reason, RvmMessage_ReasonPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmMessage_Reason.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmMessage_Reason() {}
    protected RvmMessage_Reason(Handle h, long handle) { super(h, handle); }
    protected RvmMessage_Reason(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "rawValue")
    public native @MachineSizedSInt long getRawValue();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    @Method(selector = "generic")
    public static native RvmMessage_Reason generic();
    @Method(selector = "priceIncreaseConsent")
    public static native RvmMessage_Reason priceIncreaseConsent();
    @Method(selector = "billingIssue")
    public static native RvmMessage_Reason billingIssue();
    @Method(selector = "winBackOffer")
    public static native RvmMessage_Reason winBackOffer();
    /*</methods>*/
}
