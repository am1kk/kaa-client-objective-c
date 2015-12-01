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

#import "RecordCountWithTimeLimitLogUploadStrategy.h"
#import "KaaLogging.h"

#define TAG @"RecordCountWithTimeLimitLogUploadStrategy >>>"

//Start log upload when there is countThreshold records in storage or records are stored for more then timeLimit TimeUnit units.

@implementation RecordCountWithTimeLimitLogUploadStrategy

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setLastUploadTime:[[NSDate date] timeIntervalSince1970] * 1000];
    }
    return self;
}

- (instancetype)initWithCountThreshold:(int32_t)countThreshold TimeLimit:(int64_t)timeLimit andTimeUnit:(TimeUnit)timeUnit {
    self = [self init];
    if (self) {
        [self setCountThreshold:countThreshold];
        [self setUploadCheckPeriod:[TimeUtils convert:timeLimit from:timeUnit to:TIME_UNIT_SECONDS]];
    }
    return self;
}

- (LogUploadStrategyDecision)checkUploadNeeded:(id<LogStorageStatus>)status {
    LogUploadStrategyDecision decision = LOG_UPLOAD_STRATEGY_DECISION_NOOP;
    long currentTime = [[NSDate date] timeIntervalSince1970] * 1000;
    long currentRecordCount = [status getRecordCount];

    if (currentRecordCount == self.countThreshold) {
        DDLogInfo(@"%@ Need to upload logs - current count: %li, threshold: %i",
                  TAG, currentRecordCount, self.countThreshold);
        decision = LOG_UPLOAD_STRATEGY_DECISION_UPLOAD;
        self.lastUploadTime = currentTime;
    } else if (((currentTime - self.lastUploadTime) / 1000) >= self.uploadCheckPeriod) {
        DDLogInfo(@"%@ Need to upload logs - current count: %li, lastUploadedTime: %lli, timeLimit: %lli",
                  TAG, currentRecordCount, self.lastUploadTime, self.timeLimit);
        decision = LOG_UPLOAD_STRATEGY_DECISION_UPLOAD;
        self.lastUploadTime = currentTime;
    }
    return decision;
}


@end
