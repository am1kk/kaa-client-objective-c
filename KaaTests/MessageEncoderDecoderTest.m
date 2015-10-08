//
//  MessageEncoderDecoderTest.m
//  Kaa
//
//  Created by Aleksey Gutyro on 05.10.15.
//  Copyright © 2015 CYBERVISION INC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KeyUtils.h"
#import "MessageEncoderDecoder.h"
#import "KeyPair.h"

@interface MessageEncoderDecoderTest : XCTestCase

@property (strong, nonatomic) KeyPair *clientKeyPair;
@property (strong, nonatomic) KeyPair *serverKeyPair;
@property (strong, nonatomic) KeyPair *thiefKeyPair;

@end

@interface MessageEncoderDecoderTest ()

- (NSData *) generateRandomKeyTag;

@end

@implementation MessageEncoderDecoderTest

- (void)setUp {
    [super setUp];
    
    NSData *clientPublicKeyTag = [self generateRandomKeyTag];
    NSData *clientPrivateKeyTag = [self generateRandomKeyTag];
    NSData *clientRemoteKeyTag = [self generateRandomKeyTag];
    
    NSData *serverPublicKeyTag = [self generateRandomKeyTag];
    NSData *serverPrivateKeyTag = [self generateRandomKeyTag];
    NSData *serverRemoteKeyTag = [self generateRandomKeyTag];
    
    NSData *thiefPublicKeyTag = [self generateRandomKeyTag];
    NSData *thiefPrivateKeyTag = [self generateRandomKeyTag];
    
    self.clientKeyPair = [KeyUtils generateKeyPairWithPublicTag:clientPublicKeyTag privateTag:clientPrivateKeyTag andRemoteTag:clientRemoteKeyTag];
    self.serverKeyPair = [KeyUtils generateKeyPairWithPublicTag:serverPublicKeyTag privateTag:serverPrivateKeyTag andRemoteTag:serverRemoteKeyTag];
    self.thiefKeyPair = [KeyUtils generateKeyPairWithPublicTag:thiefPublicKeyTag privateTag:thiefPrivateKeyTag andRemoteTag:nil];
}



- (void) testBasicMessageEncoderDecoder {
    
    NSString *message = [NSString stringWithFormat:@"secret%u", arc4random()];
    
    MessageEncoderDecoder *client = [[MessageEncoderDecoder alloc] initWithKeyPair:self.clientKeyPair andRemotePublicKey:[KeyUtils getPublicKeyByTag:self.serverKeyPair.publicKeyTag]];
    MessageEncoderDecoder *server = [[MessageEncoderDecoder alloc] initWithKeyPair:self.serverKeyPair andRemotePublicKey:[KeyUtils getPublicKeyByTag:self.clientKeyPair.publicKeyTag]];
    MessageEncoderDecoder *thief = [[MessageEncoderDecoder alloc] initWithKeyPair:self.thiefKeyPair andRemotePublicKey:[KeyUtils getPublicKeyByTag:self.clientKeyPair.publicKeyTag]];
    
    NSData *secretData = [client encodeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *signature = [client sign:secretData];
    NSData *encodedSessionKey = [client getEncodedSessionKey];
    
    XCTAssertTrue([server verify:secretData withSignature:signature]);

}


- (NSData *) generateRandomKeyTag {
    int randomTag = arc4random();
    return [NSData dataWithBytes:&randomTag length:sizeof(randomTag)];
}

@end
