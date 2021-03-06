//
//  DefaultLogUploadStrategy.m
//  Kaa
//
//  Created by Anton Bohomol on 8/24/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#import "DefaultLogUploadStrategy.h"
#import "KaaLogging.h"

#define TAG @"DefaultLogUploadStrategy >>>"

#define DEFAULT_UPLOAD_TIMEOUT          (2 * 60)
#define DEFAULT_UPLOAD_CHECK_PERIOD     (30)
#define DEFAULT_RETRY_PERIOD            (5 * 60)
#define DEFAULT_UPLOAD_VOLUME_THRESHOLD (8 * 1024)
#define DEFAULT_UPLOAD_COUNT_THRESHOLD  (64)
#define DEFAULT_BATCH_SIZE              (8 * 1024)
#define DEFAULT_BATCH_COUNT             (256)

@interface DefaultLogUploadStrategy ()

@property (nonatomic) NSInteger timeout;
@property (nonatomic) NSInteger uploadCheckPeriod;
@property (nonatomic) NSInteger retryPeriod;
@property (nonatomic) NSInteger volumeThreshold;
@property (nonatomic) NSInteger countThreshold;
@property (nonatomic) NSInteger batchSize;
@property (nonatomic) NSInteger batchCount;

@end

@implementation DefaultLogUploadStrategy

- (instancetype)initWithDefaults {
    self = [super init];
    if (self) {
        self.timeout = DEFAULT_UPLOAD_TIMEOUT;
        self.uploadCheckPeriod = DEFAULT_UPLOAD_CHECK_PERIOD;
        self.retryPeriod = DEFAULT_RETRY_PERIOD;
        self.volumeThreshold = DEFAULT_UPLOAD_VOLUME_THRESHOLD;
        self.countThreshold = DEFAULT_UPLOAD_COUNT_THRESHOLD;
        self.batchSize = DEFAULT_BATCH_SIZE;
        self.batchCount = DEFAULT_BATCH_COUNT;
    }
    return self;
}

- (LogUploadStrategyDecision)isUploadNeeded:(id<LogStorageStatus>)status {
    LogUploadStrategyDecision decision = LOG_UPLOAD_STRATEGY_DECISION_NOOP;
    if ([status getConsumedVolume] >= self.volumeThreshold) {
        DDLogInfo(@"%@ Need to upload logs - current size: %li, threshold: %li",
                  TAG, (long)[status getConsumedVolume], (long)self.volumeThreshold);
        decision = LOG_UPLOAD_STRATEGY_DECISION_UPLOAD;
    } else if ([status getRecordCount] >= self.countThreshold) {
        DDLogInfo(@"%@ Need to upload logs - current count: %li, threshold: %li",
                  TAG, (long)[status getRecordCount], (long)self.countThreshold);
        decision = LOG_UPLOAD_STRATEGY_DECISION_UPLOAD;
    }
    return decision;
}

- (NSInteger)getBatchSize {
    return self.batchSize;
}

- (NSInteger)getBatchCount {
    return self.batchCount;
}

- (NSInteger)getTimeout {
    return self.timeout;
}

- (NSInteger)getUploadCheckPeriod {
    return self.uploadCheckPeriod;
}

- (void)onTimeout:(id<LogFailoverCommand>)controller {
    [controller switchAccessPoint];
}

- (void)onFailure:(id<LogFailoverCommand>)controller errorCode:(LogDeliveryErrorCode)code {
    switch (code) {
        case LOG_DELIVERY_ERROR_CODE_NO_APPENDERS_CONFIGURED:
        case LOG_DELIVERY_ERROR_CODE_APPENDER_INTERNAL_ERROR:
        case LOG_DELIVERY_ERROR_CODE_REMOTE_CONNECTION_ERROR:
        case LOG_DELIVERY_ERROR_CODE_REMOTE_INTERNAL_ERROR:
            [controller retryLogUpload:self.retryPeriod];
            break;
        default:
            break;
    }
}

- (void)setTimeout:(NSInteger)timeout {
    self.timeout = timeout;
}

- (void)setRetryPeriod:(NSInteger)retryPeriod {
    self.retryPeriod = retryPeriod;
}

- (void)setVolumeThreshold:(NSInteger)volumeThreshold {
    self.volumeThreshold = volumeThreshold;
}

- (void)setCountThreshold:(NSInteger)countThreshold {
    self.countThreshold = countThreshold;
}

- (void)setBatchSize:(NSInteger)batchSize {
    self.batchSize = batchSize;
}

- (void)setBatchCount:(NSInteger)batchCount {
    self.batchCount = batchCount;
}

- (void)setUploadCheckPeriod:(NSInteger)uploadCheckPeriod {
    self.uploadCheckPeriod = uploadCheckPeriod;
}

@end
