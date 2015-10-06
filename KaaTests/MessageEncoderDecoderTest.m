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

static uint8_t clientPublicKeyIdentifier[] = "org.kaaproject.kaa.clientPublicKey";
static uint8_t clientPrivateKeyIdentifier[] = "org.kaaproject.kaa.clientPrivateKey";

static uint8_t serverPublicKeyIdentifier[] = "org.kaaproject.kaa.serverPublicKey";
static uint8_t serverPrivateKeyIdentifier[] = "org.kaaproject.kaa.serverPrivateKey";

static uint8_t thiefPublicKeyIdentifier[] = "org.kaaproject.kaa.thiefPublicKey";
static uint8_t thiefPrivateKeyIdentifier[] = "org.kaaproject.kaa.thiefPrivateKey";

@implementation MessageEncoderDecoderTest

- (void)setUp {
    [super setUp];
    
    self.clientKeyPair = [KeyUtils generateKeyPairWithPublicTag:clientPublicKeyIdentifier andPrivateTag:clientPrivateKeyIdentifier];
    self.serverKeyPair = [KeyUtils generateKeyPairWithPublicTag:serverPublicKeyIdentifier andPrivateTag:serverPrivateKeyIdentifier];
    self.thiefKeyPair = [KeyUtils generateKeyPairWithPublicTag:thiefPublicKeyIdentifier andPrivateTag:thiefPrivateKeyIdentifier];
}

- (void) testBasicMessageEncoderDecoder {
    
    NSString *message = [NSString stringWithFormat:@"secret%u", arc4random()];
    
    MessageEncoderDecoder *client = [[MessageEncoderDecoder alloc] initWithKeyPair:self.clientKeyPair andRemotePublicKey:[KeyUtils getPublicKeyForPublicTag:serverPublicKeyIdentifier]];
    MessageEncoderDecoder *server = [[MessageEncoderDecoder alloc] initWithKeyPair:self.serverKeyPair andRemotePublicKey:[KeyUtils getPublicKeyForPublicTag:clientPublicKeyIdentifier]];
    MessageEncoderDecoder *thief = [[MessageEncoderDecoder alloc] initWithKeyPair:self.thiefKeyPair andRemotePublicKey:[KeyUtils getPublicKeyForPublicTag:clientPublicKeyIdentifier]];
    
    NSData *secretData = [client encodeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *signature = [client sign:secretData];
    NSData *encodedSessionKey = [client getEncodedSessionKey];
    
    XCTAssertTrue([server verify:secretData withSignature:signature]);

}

@end
