//
//  KeyUtil.h
//  Kaa
//
//  Created by Anton Bohomol on 8/31/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KeyPair.h"

/**
 * Class is used to persist and fetch Public and Private Keys.
 */
@interface KeyUtils : NSObject

/**
 * Generate key pair.
 */
+ (KeyPair *)generateKeyPair;
+ (KeyPair *)generateKeyPairWithPublicTag:(NSData *)publicTag privateTag:(NSData *)privateTag andRemoteTag:(NSData *)remoteTag;

/**
 * Gets reference to the public key from key store.
 */
+ (SecKeyRef)getPublicKeyRef;
+ (SecKeyRef)getPublicKeyRefByTag:(NSData *)publicTag;

/**
 * Gets reference to the private key from key store.
 */
+ (SecKeyRef)getPrivateKeyRef;
+ (SecKeyRef)getPrivateKeyRefByTag:(NSData *)privateTag;

+ (NSData *)getPublicKey;
+ (NSData *)getPublicKeyByTag:(NSData *)publicTag;

+ (SecKeyRef)storePublicKey:(NSData *)publicKey withTag:(NSData *)tag;

+ (void)removeKeyByTag:(NSData *)tag;

@end
