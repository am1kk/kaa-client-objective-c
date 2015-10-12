//
//  MessageEncoderDecoderTests.m
//  Kaa
//
//  Created by Anton Bohomol on 10/10/15.
//  Copyright © 2015 CYBERVISION INC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MessageEncoderDecoder.h"
#import "KeyUtils.h"

@interface MessageEncoderDecoderTests : XCTestCase

@property (nonatomic,strong) KeyPair *clientPair;

@property (nonatomic,strong) NSData *serverPrivateTag;
@property (nonatomic,strong) NSData *serverPublicTag;
@property (nonatomic,strong) KeyPair *serverPair;

@property (nonatomic,strong) NSData *theifPrivateTag;
@property (nonatomic,strong) NSData *theifPublicTag;
@property (nonatomic,strong) KeyPair *theifPair;

@end

@implementation MessageEncoderDecoderTests

- (void)setUp {
    [super setUp];
    self.clientPair = [KeyUtils generateKeyPair];
    
    self.serverPrivateTag = [self generateTag];
    self.serverPublicTag = [self generateTag];
    self.serverPair = [KeyUtils generateKeyPairWithPrivateTag:self.serverPrivateTag andPublicTag:self.serverPublicTag];
    
    self.theifPrivateTag = [self generateTag];
    self.theifPublicTag = [self generateTag];
    self.theifPair = [KeyUtils generateKeyPairWithPrivateTag:self.theifPrivateTag andPublicTag:self.theifPublicTag];
}

- (void)tearDown {
    [super tearDown];
    [KeyUtils deleteExistingKeyPair];
    [KeyUtils removeKeyByTag:self.serverPrivateTag];
    [KeyUtils removeKeyByTag:self.serverPublicTag];
    [KeyUtils removeKeyByTag:self.theifPrivateTag];
    [KeyUtils removeKeyByTag:self.theifPublicTag];
}

- (void)testBasic {
    NSString *message = [NSString stringWithFormat:@"secret%i", arc4random()];
    NSData *messageData = [message dataUsingEncoding:NSUTF8StringEncoding];
    MessageEncoderDecoder *client = [[MessageEncoderDecoder alloc] initWithKeyPair:self.clientPair
                                                             andRemotePublicKeyRef:[self.serverPair getPublicKeyRef]];
    MessageEncoderDecoder *server = [[MessageEncoderDecoder alloc] initWithKeyPair:self.serverPair
                                                             andRemotePublicKeyRef:[self.clientPair getPublicKeyRef]];
    MessageEncoderDecoder *theif = [[MessageEncoderDecoder alloc] initWithKeyPair:self.theifPair
                                                            andRemotePublicKeyRef:[self.clientPair getPublicKeyRef]];
    NSData *secretData = [client encodeData:messageData];
    NSData *signature = [client sign:secretData];
    NSData *encodedSessionKey = [client getEncodedSessionKey];
    
    XCTAssertTrue([server verify:secretData withSignature:signature]);
    NSData *decodedData = [server decodeData:secretData withEncodedKey:encodedSessionKey];
    NSString *decodedSecret = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    
    XCTAssertTrue([message isEqualToString:decodedSecret]);
    
    NSData *theifData = [theif encodeData:messageData];
    NSData *theifSignature = [theif sign:theifData];
    XCTAssertFalse([server verify:theifData withSignature:theifSignature]);
}

- (void)testBasicSubsequentTest {
    NSString *message = [NSString stringWithFormat:@"secret%i", arc4random()];
    NSData *messageData = [message dataUsingEncoding:NSUTF8StringEncoding];
    
    MessageEncoderDecoder *client = [[MessageEncoderDecoder alloc] initWithKeyPair:self.clientPair
                                                             andRemotePublicKeyRef:[self.serverPair getPublicKeyRef]];
    MessageEncoderDecoder *client2 = [[MessageEncoderDecoder alloc] initWithKeyPair:self.theifPair
                                                             andRemotePublicKeyRef:[self.serverPair getPublicKeyRef]];
    MessageEncoderDecoder *server = [[MessageEncoderDecoder alloc] initWithKeyPair:self.serverPair
                                                             andRemotePublicKeyRef:[self.clientPair getPublicKeyRef]];
    
    NSData *secretData = [client encodeData:messageData];
    NSData *signature = [client sign:secretData];
    NSData *encodedSessionKey = [client getEncodedSessionKey];
    XCTAssertTrue([server verify:secretData withSignature:signature]);
    
    NSData *decodedData = [server decodeData:secretData withEncodedKey:encodedSessionKey];
    NSString *decodedSecret = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    XCTAssertTrue([message isEqualToString:decodedSecret]);
    
    [server setRemotePublicKeyRef:[self.theifPair getPublicKeyRef]];

    NSData *secretData2 = [client2 encodeData:messageData];
    NSData *signature2 = [client2 sign:secretData2];
    NSData *encodedSessionKey2 = [client2 getEncodedSessionKey];
    XCTAssertTrue([server verify:secretData2 withSignature:signature2]);
    
    NSData *decodedData2 = [server decodeData:secretData2 withEncodedKey:encodedSessionKey2];
    NSString *decodedSecret2 = [[NSString alloc] initWithData:decodedData2 encoding:NSUTF8StringEncoding];
    XCTAssertTrue([message isEqualToString:decodedSecret2]);
}

- (void)testBasicUpdate {
    MessageEncoderDecoder *client = [[MessageEncoderDecoder alloc] initWithKeyPair:self.clientPair
                                                             andRemotePublicKeyRef:[self.serverPair getPublicKeyRef]];
    
    BOOL test = [client getPrivateKey] != nil;
    XCTAssertTrue(test);
    test = [client getPublicKey] != nil;
    XCTAssertTrue(test);
    test = [client getRemotePublicKey] != nil;
    XCTAssertTrue(test);

}


- (NSData *)generateTag {
    int randomInt = arc4random();
    return [NSData dataWithBytes:&randomInt length:sizeof(randomInt)];
}

@end
