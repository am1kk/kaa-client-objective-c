/*
 * Copyright 2014-2015 CyberVision, Inc.
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

#import "EndpointGen.h"

/*
 * AUTO-GENERATED CODE
 */

@implementation TopicState

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.topicId to:writer];
    [self.utils serializeInt:[NSNumber numberWithInt:self.seqNumber] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.topicId];
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.seqNumber]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.topicId = [self.utils deserializeString:reader];
    self.seqNumber = [[self.utils deserializeInt:reader] intValue];
}


@end


@implementation SubscriptionCommand

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.topicId to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.command] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.topicId];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.command]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.topicId = [self.utils deserializeString:reader];
    self.command = [[self.utils deserializeEnum:reader] intValue];
}


@end


@implementation UserAttachRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.userVerifierId to:writer];
    [self.utils serializeString:self.userExternalId to:writer];
    [self.utils serializeString:self.userAccessToken to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.userVerifierId];
        recordSize += [self.utils getStringSize:self.userExternalId];
        recordSize += [self.utils getStringSize:self.userAccessToken];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.userVerifierId = [self.utils deserializeString:reader];
    self.userExternalId = [self.utils deserializeString:reader];
    self.userAccessToken = [self.utils deserializeString:reader];
}


@end


@implementation UserAttachResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeEnum:[NSNumber numberWithInt:self.result] to:writer];
    [self serializeErrorCode:self.errorCode to:writer];
    [self serializeErrorReason:self.errorReason to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.result]];
        recordSize += [self getErrorCodeSize:self.errorCode];
        recordSize += [self getErrorReasonSize:self.errorReason];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.result = [[self.utils deserializeEnum:reader] intValue];
    self.errorCode = [self deserializeErrorCode:reader];
    self.errorReason = [self deserializeErrorReason:reader];
}


- (void)serializeErrorCode:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_ERROR_CODE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeEnum:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getErrorCodeSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_ERROR_CODE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getEnumSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeErrorCode:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_ERROR_CODE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeEnum:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeErrorReason:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeString:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getErrorReasonSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getStringSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeErrorReason:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeString:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation UserAttachNotification

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.userExternalId to:writer];
    [self.utils serializeString:self.endpointAccessToken to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.userExternalId];
        recordSize += [self.utils getStringSize:self.endpointAccessToken];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.userExternalId = [self.utils deserializeString:reader];
    self.endpointAccessToken = [self.utils deserializeString:reader];
}


@end


@implementation UserDetachNotification

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.endpointAccessToken to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.endpointAccessToken];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.endpointAccessToken = [self.utils deserializeString:reader];
}


@end


@implementation EndpointAttachRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self.utils serializeString:self.endpointAccessToken to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self.utils getStringSize:self.endpointAccessToken];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.endpointAccessToken = [self.utils deserializeString:reader];
}


@end


@implementation EndpointAttachResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self serializeEndpointKeyHash:self.endpointKeyHash to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.result] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self getEndpointKeyHashSize:self.endpointKeyHash];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.result]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.endpointKeyHash = [self deserializeEndpointKeyHash:reader];
    self.result = [[self.utils deserializeEnum:reader] intValue];
}


- (void)serializeEndpointKeyHash:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeString:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointKeyHashSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getStringSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointKeyHash:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeString:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation EndpointDetachRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self.utils serializeString:self.endpointKeyHash to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self.utils getStringSize:self.endpointKeyHash];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.endpointKeyHash = [self.utils deserializeString:reader];
}


@end


@implementation EndpointDetachResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.result] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.result]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.result = [[self.utils deserializeEnum:reader] intValue];
}


@end


@implementation Event

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.seqNum] to:writer];
    [self.utils serializeString:self.eventClassFQN to:writer];
    [self.utils serializeBytes:self.eventData to:writer];
    [self serializeSource:self.source to:writer];
    [self serializeTarget:self.target to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.seqNum]];
        recordSize += [self.utils getStringSize:self.eventClassFQN];
        recordSize += [self.utils getBytesSize:self.eventData];
        recordSize += [self getSourceSize:self.source];
        recordSize += [self getTargetSize:self.target];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.seqNum = [[self.utils deserializeInt:reader] intValue];
    self.eventClassFQN = [self.utils deserializeString:reader];
    self.eventData = [self.utils deserializeBytes:reader];
    self.source = [self deserializeSource:reader];
    self.target = [self deserializeTarget:reader];
}


- (void)serializeSource:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeString:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getSourceSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getStringSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeSource:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeString:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeTarget:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeString:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getTargetSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getStringSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeTarget:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeString:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation EventListenersRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
            [self.utils serializeArray:self.eventClassFQNs to:writer withSelector:@selector(serializeString:to:) target:nil];
    }

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
            recordSize += [self.utils getArraySize:self.eventClassFQNs withSelector:@selector(getStringSize:) parameterized:YES target:self.utils];
        return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
            self.eventClassFQNs = [self.utils deserializeArray:reader withSelector:@selector(deserializeString:) andParam:nil target:nil];
    }


@end


@implementation EventListenersResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self serializeListeners:self.listeners to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.result] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self getListenersSize:self.listeners];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.result]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.listeners = [self deserializeListeners:reader];
    self.result = [[self.utils deserializeEnum:reader] intValue];
}


- (void)serializeListeners:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                    [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeString:to:) target:nil];
                }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getListenersSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                    unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getStringSize:) parameterized:YES target:self.utils];
                }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeListeners:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_STRING_OR_NULL_BRANCH_0: {
                kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeString:) andParam:nil target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation EventSequenceNumberRequest

- (void)serialize:(avro_writer_t)writer {
}

- (size_t)getSize {
    size_t recordSize = 0;
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
}


@end


@implementation EventSequenceNumberResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.seqNum] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.seqNum]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.seqNum = [[self.utils deserializeInt:reader] intValue];
}


@end


@implementation Notification

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.topicId to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.type] to:writer];
    [self serializeUid:self.uid to:writer];
    [self serializeSeqNumber:self.seqNumber to:writer];
    [self.utils serializeBytes:self.body to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.topicId];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.type]];
        recordSize += [self getUidSize:self.uid];
        recordSize += [self getSeqNumberSize:self.seqNumber];
        recordSize += [self.utils getBytesSize:self.body];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.topicId = [self.utils deserializeString:reader];
    self.type = [[self.utils deserializeEnum:reader] intValue];
    self.uid = [self deserializeUid:reader];
    self.seqNumber = [self deserializeSeqNumber:reader];
    self.body = [self.utils deserializeBytes:reader];
}


- (void)serializeUid:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeString:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getUidSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getStringSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeUid:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeString:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeSeqNumber:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_INT_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeInt:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getSeqNumberSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_INT_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getIntSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeSeqNumber:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_INT_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeInt:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation Topic

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.id to:writer];
    [self.utils serializeString:self.name to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.subscriptionType] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.id];
        recordSize += [self.utils getStringSize:self.name];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.subscriptionType]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.id = [self.utils deserializeString:reader];
    self.name = [self.utils deserializeString:reader];
    self.subscriptionType = [[self.utils deserializeEnum:reader] intValue];
}


@end


@implementation LogEntry

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeBytes:self.data to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getBytesSize:self.data];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.data = [self.utils deserializeBytes:reader];
}


@end


@implementation SyncRequestMetaData

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeString:self.sdkToken to:writer];
    [self serializeEndpointPublicKeyHash:self.endpointPublicKeyHash to:writer];
    [self serializeProfileHash:self.profileHash to:writer];
    [self serializeTimeout:self.timeout to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getStringSize:self.sdkToken];
        recordSize += [self getEndpointPublicKeyHashSize:self.endpointPublicKeyHash];
        recordSize += [self getProfileHashSize:self.profileHash];
        recordSize += [self getTimeoutSize:self.timeout];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.sdkToken = [self.utils deserializeString:reader];
    self.endpointPublicKeyHash = [self deserializeEndpointPublicKeyHash:reader];
    self.profileHash = [self deserializeProfileHash:reader];
    self.timeout = [self deserializeTimeout:reader];
}


- (void)serializeEndpointPublicKeyHash:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBytes:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointPublicKeyHashSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBytesSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointPublicKeyHash:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBytes:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeProfileHash:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBytes:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getProfileHashSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBytesSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeProfileHash:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBytes:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeTimeout:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_LONG_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeLong:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getTimeoutSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_LONG_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getLongSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeTimeout:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_LONG_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeLong:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation ProfileSyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self serializeEndpointPublicKey:self.endpointPublicKey to:writer];
    [self.utils serializeBytes:self.profileBody to:writer];
    [self serializeEndpointAccessToken:self.endpointAccessToken to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self getEndpointPublicKeySize:self.endpointPublicKey];
        recordSize += [self.utils getBytesSize:self.profileBody];
        recordSize += [self getEndpointAccessTokenSize:self.endpointAccessToken];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.endpointPublicKey = [self deserializeEndpointPublicKey:reader];
    self.profileBody = [self.utils deserializeBytes:reader];
    self.endpointAccessToken = [self deserializeEndpointAccessToken:reader];
}


- (void)serializeEndpointPublicKey:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBytes:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointPublicKeySize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBytesSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointPublicKey:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBytes:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEndpointAccessToken:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeString:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointAccessTokenSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getStringSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointAccessToken:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_STRING_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeString:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation ProtocolVersionPair

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.id] to:writer];
    [self.utils serializeInt:[NSNumber numberWithInt:self.version] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.id]];
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.version]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.id = [[self.utils deserializeInt:reader] intValue];
    self.version = [[self.utils deserializeInt:reader] intValue];
}


@end


@implementation BootstrapSyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
            [self.utils serializeArray:self.supportedProtocols to:writer withSelector:@selector(serializeRecord:to:) target:nil];
    }

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
            recordSize += [self.utils getArraySize:self.supportedProtocols withSelector:@selector(getSize) parameterized:NO target:nil];
        return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
            Class recClass = [ProtocolVersionPair class];
        self.supportedProtocols = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:recClass target:nil];
    }


@end


@implementation ConfigurationSyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.appStateSeqNumber] to:writer];
    [self serializeConfigurationHash:self.configurationHash to:writer];
    [self serializeResyncOnly:self.resyncOnly to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.appStateSeqNumber]];
        recordSize += [self getConfigurationHashSize:self.configurationHash];
        recordSize += [self getResyncOnlySize:self.resyncOnly];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.appStateSeqNumber = [[self.utils deserializeInt:reader] intValue];
    self.configurationHash = [self deserializeConfigurationHash:reader];
    self.resyncOnly = [self deserializeResyncOnly:reader];
}


- (void)serializeConfigurationHash:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBytes:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getConfigurationHashSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBytesSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeConfigurationHash:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBytes:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeResyncOnly:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BOOLEAN_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBoolean:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getResyncOnlySize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BOOLEAN_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBooleanSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeResyncOnly:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BOOLEAN_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBoolean:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation NotificationSyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.appStateSeqNumber] to:writer];
    [self serializeTopicListHash:self.topicListHash to:writer];
    [self serializeTopicStates:self.topicStates to:writer];
    [self serializeAcceptedUnicastNotifications:self.acceptedUnicastNotifications to:writer];
    [self serializeSubscriptionCommands:self.subscriptionCommands to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.appStateSeqNumber]];
        recordSize += [self getTopicListHashSize:self.topicListHash];
        recordSize += [self getTopicStatesSize:self.topicStates];
        recordSize += [self getAcceptedUnicastNotificationsSize:self.acceptedUnicastNotifications];
        recordSize += [self getSubscriptionCommandsSize:self.subscriptionCommands];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.appStateSeqNumber = [[self.utils deserializeInt:reader] intValue];
    self.topicListHash = [self deserializeTopicListHash:reader];
    self.topicStates = [self deserializeTopicStates:reader];
    self.acceptedUnicastNotifications = [self deserializeAcceptedUnicastNotifications:reader];
    self.subscriptionCommands = [self deserializeSubscriptionCommands:reader];
}


- (void)serializeTopicListHash:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBytes:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getTopicListHashSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBytesSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeTopicListHash:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBytes:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeTopicStates:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_TOPIC_STATE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getTopicStatesSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_TOPIC_STATE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeTopicStates:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_TOPIC_STATE_OR_NULL_BRANCH_0: {
                Class dataClass = [TopicState class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeAcceptedUnicastNotifications:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                    [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeString:to:) target:nil];
                }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getAcceptedUnicastNotificationsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_STRING_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                    unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getStringSize:) parameterized:YES target:self.utils];
                }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeAcceptedUnicastNotifications:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_STRING_OR_NULL_BRANCH_0: {
                kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeString:) andParam:nil target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeSubscriptionCommands:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_SUBSCRIPTION_COMMAND_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getSubscriptionCommandsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_SUBSCRIPTION_COMMAND_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeSubscriptionCommands:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_SUBSCRIPTION_COMMAND_OR_NULL_BRANCH_0: {
                Class dataClass = [SubscriptionCommand class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation UserSyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self serializeUserAttachRequest:self.userAttachRequest to:writer];
    [self serializeEndpointAttachRequests:self.endpointAttachRequests to:writer];
    [self serializeEndpointDetachRequests:self.endpointDetachRequests to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self getUserAttachRequestSize:self.userAttachRequest];
        recordSize += [self getEndpointAttachRequestsSize:self.endpointAttachRequests];
        recordSize += [self getEndpointDetachRequestsSize:self.endpointDetachRequests];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.userAttachRequest = [self deserializeUserAttachRequest:reader];
    self.endpointAttachRequests = [self deserializeEndpointAttachRequests:reader];
    self.endpointDetachRequests = [self deserializeEndpointDetachRequests:reader];
}


- (void)serializeUserAttachRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getUserAttachRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeUserAttachRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[UserAttachRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEndpointAttachRequests:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_ATTACH_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointAttachRequestsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_ATTACH_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointAttachRequests:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_ATTACH_REQUEST_OR_NULL_BRANCH_0: {
                Class dataClass = [EndpointAttachRequest class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEndpointDetachRequests:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_DETACH_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointDetachRequestsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_DETACH_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointDetachRequests:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_DETACH_REQUEST_OR_NULL_BRANCH_0: {
                Class dataClass = [EndpointDetachRequest class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation EventSyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self serializeEventSequenceNumberRequest:self.eventSequenceNumberRequest to:writer];
    [self serializeEventListenersRequests:self.eventListenersRequests to:writer];
    [self serializeEvents:self.events to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self getEventSequenceNumberRequestSize:self.eventSequenceNumberRequest];
        recordSize += [self getEventListenersRequestsSize:self.eventListenersRequests];
        recordSize += [self getEventsSize:self.events];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.eventSequenceNumberRequest = [self deserializeEventSequenceNumberRequest:reader];
    self.eventListenersRequests = [self deserializeEventListenersRequests:reader];
    self.events = [self deserializeEvents:reader];
}


- (void)serializeEventSequenceNumberRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        default:
            break;
        }
    }
}

- (size_t)getEventSequenceNumberRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEventSequenceNumberRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SEQUENCE_NUMBER_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[EventSequenceNumberRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEventListenersRequests:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_LISTENERS_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEventListenersRequestsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_LISTENERS_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEventListenersRequests:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_LISTENERS_REQUEST_OR_NULL_BRANCH_0: {
                Class dataClass = [EventListenersRequest class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEvents:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEventsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEvents:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_OR_NULL_BRANCH_0: {
                Class dataClass = [Event class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation LogSyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self serializeLogEntries:self.logEntries to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self getLogEntriesSize:self.logEntries];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.logEntries = [self deserializeLogEntries:reader];
}


- (void)serializeLogEntries:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_LOG_ENTRY_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getLogEntriesSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_LOG_ENTRY_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeLogEntries:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_LOG_ENTRY_OR_NULL_BRANCH_0: {
                Class dataClass = [LogEntry class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation ProtocolMetaData

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.accessPointId] to:writer];
    [self.protocolVersionInfo serialize:writer];
    [self.utils serializeBytes:self.connectionInfo to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.accessPointId]];
        recordSize += [self.protocolVersionInfo getSize];
        recordSize += [self.utils getBytesSize:self.connectionInfo];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.accessPointId = [[self.utils deserializeInt:reader] intValue];
    self.protocolVersionInfo = [self.utils deserializeRecord:reader as:[ProtocolVersionPair class]];
    self.connectionInfo = [self.utils deserializeBytes:reader];
}


@end


@implementation BootstrapSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
            [self.utils serializeArray:self.supportedProtocols to:writer withSelector:@selector(serializeRecord:to:) target:nil];
    }

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
            recordSize += [self.utils getArraySize:self.supportedProtocols withSelector:@selector(getSize) parameterized:NO target:nil];
        return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
            Class recClass = [ProtocolMetaData class];
        self.supportedProtocols = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:recClass target:nil];
    }


@end


@implementation ProfileSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeEnum:[NSNumber numberWithInt:self.responseStatus] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.responseStatus]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.responseStatus = [[self.utils deserializeEnum:reader] intValue];
}


@end


@implementation ConfigurationSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.appStateSeqNumber] to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.responseStatus] to:writer];
    [self serializeConfSchemaBody:self.confSchemaBody to:writer];
    [self serializeConfDeltaBody:self.confDeltaBody to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.appStateSeqNumber]];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.responseStatus]];
        recordSize += [self getConfSchemaBodySize:self.confSchemaBody];
        recordSize += [self getConfDeltaBodySize:self.confDeltaBody];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.appStateSeqNumber = [[self.utils deserializeInt:reader] intValue];
    self.responseStatus = [[self.utils deserializeEnum:reader] intValue];
    self.confSchemaBody = [self deserializeConfSchemaBody:reader];
    self.confDeltaBody = [self deserializeConfDeltaBody:reader];
}


- (void)serializeConfSchemaBody:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBytes:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getConfSchemaBodySize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBytesSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeConfSchemaBody:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBytes:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeConfDeltaBody:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeBytes:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getConfDeltaBodySize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getBytesSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeConfDeltaBody:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BYTES_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeBytes:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation NotificationSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.appStateSeqNumber] to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.responseStatus] to:writer];
    [self serializeNotifications:self.notifications to:writer];
    [self serializeAvailableTopics:self.availableTopics to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.appStateSeqNumber]];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.responseStatus]];
        recordSize += [self getNotificationsSize:self.notifications];
        recordSize += [self getAvailableTopicsSize:self.availableTopics];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.appStateSeqNumber = [[self.utils deserializeInt:reader] intValue];
    self.responseStatus = [[self.utils deserializeEnum:reader] intValue];
    self.notifications = [self deserializeNotifications:reader];
    self.availableTopics = [self deserializeAvailableTopics:reader];
}


- (void)serializeNotifications:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_NOTIFICATION_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getNotificationsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_NOTIFICATION_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeNotifications:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_NOTIFICATION_OR_NULL_BRANCH_0: {
                Class dataClass = [Notification class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeAvailableTopics:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_TOPIC_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getAvailableTopicsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_TOPIC_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeAvailableTopics:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_TOPIC_OR_NULL_BRANCH_0: {
                Class dataClass = [Topic class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation UserSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self serializeUserAttachResponse:self.userAttachResponse to:writer];
    [self serializeUserAttachNotification:self.userAttachNotification to:writer];
    [self serializeUserDetachNotification:self.userDetachNotification to:writer];
    [self serializeEndpointAttachResponses:self.endpointAttachResponses to:writer];
    [self serializeEndpointDetachResponses:self.endpointDetachResponses to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self getUserAttachResponseSize:self.userAttachResponse];
        recordSize += [self getUserAttachNotificationSize:self.userAttachNotification];
        recordSize += [self getUserDetachNotificationSize:self.userDetachNotification];
        recordSize += [self getEndpointAttachResponsesSize:self.endpointAttachResponses];
        recordSize += [self getEndpointDetachResponsesSize:self.endpointDetachResponses];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.userAttachResponse = [self deserializeUserAttachResponse:reader];
    self.userAttachNotification = [self deserializeUserAttachNotification:reader];
    self.userDetachNotification = [self deserializeUserDetachNotification:reader];
    self.endpointAttachResponses = [self deserializeEndpointAttachResponses:reader];
    self.endpointDetachResponses = [self deserializeEndpointDetachResponses:reader];
}


- (void)serializeUserAttachResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getUserAttachResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeUserAttachResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[UserAttachResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeUserAttachNotification:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_NOTIFICATION_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getUserAttachNotificationSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_NOTIFICATION_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeUserAttachNotification:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_ATTACH_NOTIFICATION_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[UserAttachNotification class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeUserDetachNotification:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_DETACH_NOTIFICATION_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getUserDetachNotificationSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_USER_DETACH_NOTIFICATION_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeUserDetachNotification:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_DETACH_NOTIFICATION_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[UserDetachNotification class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEndpointAttachResponses:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_ATTACH_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointAttachResponsesSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_ATTACH_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointAttachResponses:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_ATTACH_RESPONSE_OR_NULL_BRANCH_0: {
                Class dataClass = [EndpointAttachResponse class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEndpointDetachResponses:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_DETACH_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEndpointDetachResponsesSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_DETACH_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEndpointDetachResponses:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_ENDPOINT_DETACH_RESPONSE_OR_NULL_BRANCH_0: {
                Class dataClass = [EndpointDetachResponse class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation EventSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self serializeEventSequenceNumberResponse:self.eventSequenceNumberResponse to:writer];
    [self serializeEventListenersResponses:self.eventListenersResponses to:writer];
    [self serializeEvents:self.events to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self getEventSequenceNumberResponseSize:self.eventSequenceNumberResponse];
        recordSize += [self getEventListenersResponsesSize:self.eventListenersResponses];
        recordSize += [self getEventsSize:self.events];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.eventSequenceNumberResponse = [self deserializeEventSequenceNumberResponse:reader];
    self.eventListenersResponses = [self deserializeEventListenersResponses:reader];
    self.events = [self deserializeEvents:reader];
}


- (void)serializeEventSequenceNumberResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SEQUENCE_NUMBER_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEventSequenceNumberResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SEQUENCE_NUMBER_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEventSequenceNumberResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SEQUENCE_NUMBER_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[EventSequenceNumberResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEventListenersResponses:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_LISTENERS_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEventListenersResponsesSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_LISTENERS_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEventListenersResponses:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_LISTENERS_RESPONSE_OR_NULL_BRANCH_0: {
                Class dataClass = [EventListenersResponse class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEvents:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEventsSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEvents:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_EVENT_OR_NULL_BRANCH_0: {
                Class dataClass = [Event class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation LogDeliveryStatus

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.result] to:writer];
    [self serializeErrorCode:self.errorCode to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.result]];
        recordSize += [self getErrorCodeSize:self.errorCode];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.result = [[self.utils deserializeEnum:reader] intValue];
    self.errorCode = [self deserializeErrorCode:reader];
}


- (void)serializeErrorCode:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_DELIVERY_ERROR_CODE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeEnum:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getErrorCodeSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_DELIVERY_ERROR_CODE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [self.utils getEnumSize:kaaUnion.data];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeErrorCode:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_DELIVERY_ERROR_CODE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeEnum:reader];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation LogSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self serializeDeliveryStatuses:self.deliveryStatuses to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self getDeliveryStatusesSize:self.deliveryStatuses];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.deliveryStatuses = [self deserializeDeliveryStatuses:reader];
}


- (void)serializeDeliveryStatuses:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_LOG_DELIVERY_STATUS_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            [self.utils serializeArray:kaaUnion.data to:writer withSelector:@selector(serializeRecord:to:) target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getDeliveryStatusesSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_LOG_DELIVERY_STATUS_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                            unionSize += [self.utils getArraySize:kaaUnion.data withSelector:@selector(getSize) parameterized:NO target:nil];
                        }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeDeliveryStatuses:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_ARRAY_LOG_DELIVERY_STATUS_OR_NULL_BRANCH_0: {
                Class dataClass = [LogDeliveryStatus class];
            kaaUnion.data = [self.utils deserializeArray:reader withSelector:@selector(deserializeRecord:as:) andParam:dataClass target:nil];
                break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation RedirectSyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.accessPointId] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.accessPointId]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.accessPointId = [[self.utils deserializeInt:reader] intValue];
}


@end


@implementation SyncRequest

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self serializeSyncRequestMetaData:self.syncRequestMetaData to:writer];
    [self serializeBootstrapSyncRequest:self.bootstrapSyncRequest to:writer];
    [self serializeProfileSyncRequest:self.profileSyncRequest to:writer];
    [self serializeConfigurationSyncRequest:self.configurationSyncRequest to:writer];
    [self serializeNotificationSyncRequest:self.notificationSyncRequest to:writer];
    [self serializeUserSyncRequest:self.userSyncRequest to:writer];
    [self serializeEventSyncRequest:self.eventSyncRequest to:writer];
    [self serializeLogSyncRequest:self.logSyncRequest to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self getSyncRequestMetaDataSize:self.syncRequestMetaData];
        recordSize += [self getBootstrapSyncRequestSize:self.bootstrapSyncRequest];
        recordSize += [self getProfileSyncRequestSize:self.profileSyncRequest];
        recordSize += [self getConfigurationSyncRequestSize:self.configurationSyncRequest];
        recordSize += [self getNotificationSyncRequestSize:self.notificationSyncRequest];
        recordSize += [self getUserSyncRequestSize:self.userSyncRequest];
        recordSize += [self getEventSyncRequestSize:self.eventSyncRequest];
        recordSize += [self getLogSyncRequestSize:self.logSyncRequest];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.syncRequestMetaData = [self deserializeSyncRequestMetaData:reader];
    self.bootstrapSyncRequest = [self deserializeBootstrapSyncRequest:reader];
    self.profileSyncRequest = [self deserializeProfileSyncRequest:reader];
    self.configurationSyncRequest = [self deserializeConfigurationSyncRequest:reader];
    self.notificationSyncRequest = [self deserializeNotificationSyncRequest:reader];
    self.userSyncRequest = [self deserializeUserSyncRequest:reader];
    self.eventSyncRequest = [self deserializeEventSyncRequest:reader];
    self.logSyncRequest = [self deserializeLogSyncRequest:reader];
}


- (void)serializeSyncRequestMetaData:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_SYNC_REQUEST_META_DATA_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getSyncRequestMetaDataSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_SYNC_REQUEST_META_DATA_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeSyncRequestMetaData:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_SYNC_REQUEST_META_DATA_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[SyncRequestMetaData class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeBootstrapSyncRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BOOTSTRAP_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getBootstrapSyncRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BOOTSTRAP_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeBootstrapSyncRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BOOTSTRAP_SYNC_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[BootstrapSyncRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeProfileSyncRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_PROFILE_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getProfileSyncRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_PROFILE_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeProfileSyncRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_PROFILE_SYNC_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[ProfileSyncRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeConfigurationSyncRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_CONFIGURATION_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getConfigurationSyncRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_CONFIGURATION_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeConfigurationSyncRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_CONFIGURATION_SYNC_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[ConfigurationSyncRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeNotificationSyncRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_NOTIFICATION_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getNotificationSyncRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_NOTIFICATION_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeNotificationSyncRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_NOTIFICATION_SYNC_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[NotificationSyncRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeUserSyncRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getUserSyncRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_USER_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeUserSyncRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_SYNC_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[UserSyncRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEventSyncRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEventSyncRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEventSyncRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SYNC_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[EventSyncRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeLogSyncRequest:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getLogSyncRequestSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_SYNC_REQUEST_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeLogSyncRequest:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_SYNC_REQUEST_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[LogSyncRequest class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation SyncResponse

- (void)serialize:(avro_writer_t)writer {
    [self.utils serializeInt:[NSNumber numberWithInt:self.requestId] to:writer];
    [self.utils serializeEnum:[NSNumber numberWithInt:self.status] to:writer];
    [self serializeBootstrapSyncResponse:self.bootstrapSyncResponse to:writer];
    [self serializeProfileSyncResponse:self.profileSyncResponse to:writer];
    [self serializeConfigurationSyncResponse:self.configurationSyncResponse to:writer];
    [self serializeNotificationSyncResponse:self.notificationSyncResponse to:writer];
    [self serializeUserSyncResponse:self.userSyncResponse to:writer];
    [self serializeEventSyncResponse:self.eventSyncResponse to:writer];
    [self serializeRedirectSyncResponse:self.redirectSyncResponse to:writer];
    [self serializeLogSyncResponse:self.logSyncResponse to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.requestId]];
        recordSize += [self.utils getEnumSize:[NSNumber numberWithInt:self.status]];
        recordSize += [self getBootstrapSyncResponseSize:self.bootstrapSyncResponse];
        recordSize += [self getProfileSyncResponseSize:self.profileSyncResponse];
        recordSize += [self getConfigurationSyncResponseSize:self.configurationSyncResponse];
        recordSize += [self getNotificationSyncResponseSize:self.notificationSyncResponse];
        recordSize += [self getUserSyncResponseSize:self.userSyncResponse];
        recordSize += [self getEventSyncResponseSize:self.eventSyncResponse];
        recordSize += [self getRedirectSyncResponseSize:self.redirectSyncResponse];
        recordSize += [self getLogSyncResponseSize:self.logSyncResponse];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.requestId = [[self.utils deserializeInt:reader] intValue];
    self.status = [[self.utils deserializeEnum:reader] intValue];
    self.bootstrapSyncResponse = [self deserializeBootstrapSyncResponse:reader];
    self.profileSyncResponse = [self deserializeProfileSyncResponse:reader];
    self.configurationSyncResponse = [self deserializeConfigurationSyncResponse:reader];
    self.notificationSyncResponse = [self deserializeNotificationSyncResponse:reader];
    self.userSyncResponse = [self deserializeUserSyncResponse:reader];
    self.eventSyncResponse = [self deserializeEventSyncResponse:reader];
    self.redirectSyncResponse = [self deserializeRedirectSyncResponse:reader];
    self.logSyncResponse = [self deserializeLogSyncResponse:reader];
}


- (void)serializeBootstrapSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_BOOTSTRAP_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getBootstrapSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_BOOTSTRAP_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeBootstrapSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_BOOTSTRAP_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[BootstrapSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeProfileSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_PROFILE_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getProfileSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_PROFILE_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeProfileSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_PROFILE_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[ProfileSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeConfigurationSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_CONFIGURATION_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getConfigurationSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_CONFIGURATION_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeConfigurationSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_CONFIGURATION_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[ConfigurationSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeNotificationSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_NOTIFICATION_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getNotificationSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_NOTIFICATION_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeNotificationSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_NOTIFICATION_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[NotificationSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeUserSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getUserSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_USER_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeUserSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_USER_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[UserSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeEventSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getEventSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeEventSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_EVENT_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[EventSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeRedirectSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_REDIRECT_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getRedirectSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_REDIRECT_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeRedirectSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_REDIRECT_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[RedirectSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

- (void)serializeLogSyncResponse:(KAAUnion *)kaaUnion to:(avro_writer_t)writer {

    if (kaaUnion) {
        avro_binary_encoding.write_long(writer, kaaUnion.branch);

        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                [self.utils serializeRecord:kaaUnion.data to:writer];
            }
            break;
        }
        default:
            break;
        }
    }
}

- (size_t)getLogSyncResponseSize:(KAAUnion *)kaaUnion {
    size_t unionSize = 0;
    if (kaaUnion) {
        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_SYNC_RESPONSE_OR_NULL_BRANCH_0:
        {
            if (kaaUnion.data) {
                unionSize += [((id<Avro>)kaaUnion.data) getSize];
            }
            break;
        }
        default:
            break;
        }
    }
    return unionSize;
}

- (KAAUnion *)deserializeLogSyncResponse:(avro_reader_t)reader {

    KAAUnion *kaaUnion = [[KAAUnion alloc] init];

        int64_t branch;
        avro_binary_encoding.read_long(reader, &branch);
        kaaUnion.branch = (int)branch;

        switch (kaaUnion.branch) {
        case KAA_UNION_LOG_SYNC_RESPONSE_OR_NULL_BRANCH_0: {
            kaaUnion.data = [self.utils deserializeRecord:reader as:[LogSyncResponse class]];
            break;
        }
        default:
            break;
        }

    return kaaUnion;
}

@end


@implementation TopicSubscriptionInfo

- (void)serialize:(avro_writer_t)writer {
    [self.topicInfo serialize:writer];
    [self.utils serializeInt:[NSNumber numberWithInt:self.seqNumber] to:writer];
}

- (size_t)getSize {
    size_t recordSize = 0;
        recordSize += [self.topicInfo getSize];
        recordSize += [self.utils getIntSize:[NSNumber numberWithInt:self.seqNumber]];
    return recordSize;
}

- (void)deserialize:(avro_reader_t)reader {
    self.topicInfo = [self.utils deserializeRecord:reader as:[Topic class]];
    self.seqNumber = [[self.utils deserializeInt:reader] intValue];
}


@end
