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


import org.robovm.apple.foundation.NSData;
import org.robovm.apple.foundation.NSObject;
import org.robovm.objc.ObjCRuntime;
import org.robovm.objc.annotation.NativeClass;
import org.robovm.objc.annotation.Property;
import org.robovm.rt.bro.annotation.Library;

@Library(Library.INTERNAL) @NativeClass("StoreKitRvm.RvmECDSASignature")
public class ECDSASignature extends NSObject {
    static { ObjCRuntime.bind(ECDSASignature.class); }

    protected ECDSASignature() {}
    protected ECDSASignature(Handle h, long handle) { super(h, handle); }
    protected ECDSASignature(SkipInit skipInit) { super(skipInit); }

    @Property(selector = "rawRepresentation")
    public native NSData getRawRepresentation();
    @Property(selector = "derRepresentation")
    public native NSData getDerRepresentation();
}
