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
 * @since Available in iOS 15.0 and later.
 */
/*</javadoc>*/
/*<annotations>*/@Library(Library.INTERNAL) @NativeClass/*</annotations>*/
/*<visibility>*/public/*</visibility>*/ class /*<name>*/RvmVerificationResult_RenewalInfo/*</name>*/ 
    extends /*<extends>*/NSObject/*</extends>*/ 
    /*<implements>*//*</implements>*/ {

    /*<ptr>*/public static class RvmVerificationResult_RenewalInfoPtr extends Ptr<RvmVerificationResult_RenewalInfo, RvmVerificationResult_RenewalInfoPtr> {}/*</ptr>*/
    /*<bind>*/static { ObjCRuntime.bind(RvmVerificationResult_RenewalInfo.class); }/*</bind>*/
    /*<constants>*//*</constants>*/
    /*<constructors>*/
    protected RvmVerificationResult_RenewalInfo() {}
    protected RvmVerificationResult_RenewalInfo(Handle h, long handle) { super(h, handle); }
    protected RvmVerificationResult_RenewalInfo(SkipInit skipInit) { super(skipInit); }
    /*</constructors>*/
    /*<properties>*/
    @Property(selector = "isVerified")
    public native boolean isVerified();
    @Property(selector = "unsafePayloadValue")
    public native RvmProduct_SubscriptionInfo_RenewalInfo getUnsafePayloadValue();
    @Property(selector = "error")
    public native NSError getError();
    @Property(selector = "jwsRepresentation")
    public native String getJwsRepresentation();
    @Property(selector = "headerData")
    public native NSData getHeaderData();
    @Property(selector = "payloadData")
    public native NSData getPayloadData();
    @Property(selector = "signatureData")
    public native NSData getSignatureData();
    @Property(selector = "signature")
    public native RvmECDSASignature getSignature();
    @Property(selector = "signedData")
    public native NSData getSignedData();
    @Property(selector = "signedDate")
    public native NSDate getSignedDate();
    @Property(selector = "deviceVerification")
    public native NSData getDeviceVerification();
    @Property(selector = "deviceVerificationNonce")
    public native NSUUID getDeviceVerificationNonce();
    /*</properties>*/
    /*<members>*//*</members>*/
    /*<methods>*/
    public RvmProduct_SubscriptionInfo_RenewalInfo getPayloadValue() throws NSErrorException {
       NSError.NSErrorPtr ptr = new NSError.NSErrorPtr();
       RvmProduct_SubscriptionInfo_RenewalInfo result = getPayloadValue(ptr);
       if (ptr.get() != null) { throw new NSErrorException(ptr.get()); }
       return result;
    }
    @Method(selector = "getPayloadValueAndReturnError:")
    private native RvmProduct_SubscriptionInfo_RenewalInfo getPayloadValue(NSError.NSErrorPtr error);
    /*</methods>*/
}
