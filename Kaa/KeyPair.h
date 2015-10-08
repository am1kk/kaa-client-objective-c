//
//  KeyPair.h
//  Kaa
//
//  Created by Anton Bohomol on 8/31/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Used to hold Public and Private key pair.
 */
@interface KeyPair : NSObject

@property (strong, nonatomic) NSData *publicKeyTag;
@property (strong, nonatomic) NSData *privateKeyTag;
@property (strong, nonatomic) NSData *remoteKeyTag;


- (instancetype)initWithPrivate:(SecKeyRef)privateKey andPublic:(SecKeyRef)publicKey;
- (instancetype)initWithPrivate:(SecKeyRef)privateKey public:(SecKeyRef)publicKey privateKeyTag:(NSData *)privateKey publicKeyTag:(NSData *)publicKeyTag andRemoteKeyTag:(NSData *)remoteKeyTag;


- (SecKeyRef)getPrivateKeyRef;
- (SecKeyRef)getPublicKeyRef;

@end
