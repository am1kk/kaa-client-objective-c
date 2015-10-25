//
//  DefaultUserTransportTest.m
//  Kaa
//
//  Created by Aleksey Gutyro on 22.10.15.
//  Copyright © 2015 CYBERVISION INC. All rights reserved.
//
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#import <XCTest/XCTest.h>
#import "DefaultUserTransport.h"
#import "EndpointAccessToken.h"
#import "EndpointKeyHash.h"

static int REQUEST_ID_1 = 42;
static int REQUEST_ID_2 = 73;

@interface DefaultUserTransportTest : XCTestCase

@end

@implementation DefaultUserTransportTest

- (void)testSyncNegative {
    id <KaaClientState> clientState = mockProtocol(@protocol(KaaClientState));
    id <UserTransport> transport = [[DefaultUserTransport alloc] init];
    [transport setClientState:clientState];
    @try {
        [transport sync];
        XCTFail();
    }
    @catch (NSException *exception) {
        NSLog(@"testSyncNegative succeed. Caught ChannelRuntimeException");
    }
}

- (void)testSync {
    id <KaaChannelManager> channelManager = mockProtocol(@protocol(KaaChannelManager));
    id <KaaClientState> clientState = mockProtocol(@protocol(KaaClientState));
    id <UserTransport> transport = [[DefaultUserTransport alloc] init];
    [transport setClientState:clientState];
    [transport setChannelManager:channelManager];
    [transport sync];
    
    [verifyCount(channelManager, times(1)) sync:TRANSPORT_TYPE_USER];
}

- (void)testCreateRequest {
    EndpointAccessToken *accTok1 = [[EndpointAccessToken alloc] initWithToken:@"accessToken1"];
    EndpointKeyHash *keyHash1 = [[EndpointKeyHash alloc] initWithKeyHash:@"keyHash1"];
    NSDictionary *attachedEPs = [NSDictionary dictionaryWithObject:accTok1 forKey:[NSNumber numberWithInt:REQUEST_ID_1]];
    NSDictionary *detachedEPs = [NSDictionary dictionaryWithObject:keyHash1 forKey:[NSNumber numberWithInt:REQUEST_ID_1]];
    
    id <EndpointRegistrationProcessor> processor =
    mockProtocol(@protocol(EndpointRegistrationProcessor));
    
    [given([processor getAttachEndpointRequests]) willReturn:attachedEPs];
    [given([processor getDetachEndpointRequests]) willReturn:detachedEPs];
    
    id <UserTransport> transport = [[DefaultUserTransport alloc] init];
    [transport createUserRequest];
    [transport setEndpointRegistrationProcessor:processor];
    
    UserSyncRequest *request = [transport createUserRequest];
    
    [verifyCount(processor, times(1)) getAttachEndpointRequests];
    [verifyCount(processor, times(1)) getDetachEndpointRequests];
    [verifyCount(processor, times(1)) getUserAttachRequest];
    
    XCTAssertTrue(![request.endpointDetachRequests.data count] == 0);
    XCTAssertTrue(![request.endpointAttachRequests.data count] == 0);
}

- (void)testOnUserResponse {
    EndpointAccessToken *accTok1 = [[EndpointAccessToken alloc] initWithToken:@"accessToken1"];
    EndpointAccessToken *accTok2 = [[EndpointAccessToken alloc] initWithToken:@"accessToken2"];
    EndpointKeyHash *keyHash1 = [[EndpointKeyHash alloc] initWithKeyHash:@"keyHash1"];
    EndpointKeyHash *keyHash2 = [[EndpointKeyHash alloc] initWithKeyHash:@"keyHash2"];
    NSDictionary *attachedEPs = [NSDictionary dictionaryWithObjects:@[accTok1, accTok2] forKeys:@[[NSNumber numberWithInt:REQUEST_ID_1], [NSNumber numberWithInt:REQUEST_ID_2]]];
    NSDictionary *detachedEPs = [NSDictionary dictionaryWithObjects:@[keyHash1, keyHash2] forKeys:@[[NSNumber numberWithInt:REQUEST_ID_1], [NSNumber numberWithInt:REQUEST_ID_2]]];
    
    id <KaaClientState> clientState = mockProtocol(@protocol(KaaClientState));
    id <EndpointRegistrationProcessor> processor = mockProtocol(@protocol(EndpointRegistrationProcessor));
    
    
    [given([processor getAttachEndpointRequests]) willReturn:attachedEPs];
    [given([processor getDetachEndpointRequests]) willReturn:detachedEPs];
    
    id <UserTransport> transport = [[DefaultUserTransport alloc] init];
    
    EndpointAttachResponse *attachResponse1 = [[EndpointAttachResponse alloc] init];
    EndpointAttachResponse *attachResponse2 = [[EndpointAttachResponse alloc] init];
    EndpointAttachResponse *attachResponse3 = [[EndpointAttachResponse alloc] init];
    attachResponse1.requestId = REQUEST_ID_1;
    attachResponse1.endpointKeyHash =
    [KAAUnion unionWithBranch:KAA_UNION_STRING_OR_NULL_BRANCH_0 andData:@"keyHash1"];
    attachResponse1.result = SYNC_RESPONSE_RESULT_TYPE_SUCCESS;
    attachResponse2.requestId = REQUEST_ID_2;
    attachResponse2.endpointKeyHash =
    [KAAUnion unionWithBranch:KAA_UNION_STRING_OR_NULL_BRANCH_0 andData:@"keyHash2"];
    attachResponse2.result = SYNC_RESPONSE_RESULT_TYPE_SUCCESS;
    attachResponse3.requestId = REQUEST_ID_1 + 1;
    attachResponse3.endpointKeyHash =
    [KAAUnion unionWithBranch:KAA_UNION_STRING_OR_NULL_BRANCH_0 andData:@"keyHash2"];
    attachResponse3.result = SYNC_RESPONSE_RESULT_TYPE_FAILURE;
    
    EndpointDetachResponse *detachResponse1 = [[EndpointDetachResponse alloc] init];
    EndpointDetachResponse *detachResponse2 = [[EndpointDetachResponse alloc] init];
    detachResponse1.requestId = REQUEST_ID_1;
    detachResponse1.result = SYNC_RESPONSE_RESULT_TYPE_SUCCESS;
    detachResponse2.requestId = REQUEST_ID_1 + 2;
    detachResponse2.result = SYNC_RESPONSE_RESULT_TYPE_FAILURE;
    
    UserSyncResponse *response1 = [[UserSyncResponse alloc] init];
    response1.userAttachResponse =
    [KAAUnion unionWithBranch:KAA_UNION_USER_ATTACH_RESPONSE_OR_NULL_BRANCH_1];
    response1.userAttachNotification =
    [KAAUnion unionWithBranch:KAA_UNION_USER_ATTACH_NOTIFICATION_OR_NULL_BRANCH_1];
    response1.userDetachNotification =
    [KAAUnion unionWithBranch:KAA_UNION_USER_DETACH_NOTIFICATION_OR_NULL_BRANCH_1];
    response1.endpointAttachResponses =
    [KAAUnion unionWithBranch:KAA_UNION_ARRAY_ENDPOINT_ATTACH_RESPONSE_OR_NULL_BRANCH_0
                      andData:@[attachResponse1, attachResponse2, attachResponse3]];
    response1.endpointDetachResponses =
    [KAAUnion unionWithBranch:KAA_UNION_ARRAY_ENDPOINT_DETACH_RESPONSE_OR_NULL_BRANCH_0
                      andData:@[detachResponse1, detachResponse2]];
    
    [transport onUserResponse:response1];
    [transport setEndpointRegistrationProcessor:processor];
    [transport setClientState:clientState];
    [transport onUserResponse:response1];
    
    [verifyCount(processor, times(1)) onUpdate:anything()
                               detachResponses:anything()
                                  userResponse:anything()
                        userAttachNotification:anything()
                        userDetachNotification:anything()];
    
    EndpointDetachResponse *detachResponse3 = [[EndpointDetachResponse alloc] init];
    detachResponse3.requestId = REQUEST_ID_2;
    detachResponse3.result = SYNC_RESPONSE_RESULT_TYPE_SUCCESS;
    UserSyncResponse *response2 = [[UserSyncResponse alloc] init];
    response2.userAttachResponse =
    [KAAUnion unionWithBranch:KAA_UNION_USER_ATTACH_RESPONSE_OR_NULL_BRANCH_1];
    response2.userAttachNotification =
    [KAAUnion unionWithBranch:KAA_UNION_USER_ATTACH_NOTIFICATION_OR_NULL_BRANCH_1];
    response2.userDetachNotification =
    [KAAUnion unionWithBranch:KAA_UNION_USER_DETACH_NOTIFICATION_OR_NULL_BRANCH_1];
    response2.endpointAttachResponses =
    [KAAUnion unionWithBranch:KAA_UNION_ARRAY_ENDPOINT_ATTACH_RESPONSE_OR_NULL_BRANCH_1];
    response2.endpointDetachResponses =
    [KAAUnion unionWithBranch:KAA_UNION_ARRAY_ENDPOINT_DETACH_RESPONSE_OR_NULL_BRANCH_0
                      andData:@[detachResponse3]];
    
    [transport onUserResponse:response2];
    
    [verifyCount(clientState, times(2)) setAttachedEndpoints:anything()];
}

@end