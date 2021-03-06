//
//  LogUploadStrategy.h
//  Kaa
//
//  Created by Anton Bohomol on 7/7/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#ifndef Kaa_LogUploadStrategy_h
#define Kaa_LogUploadStrategy_h

#import <Foundation/Foundation.h>
#import "LogStorage.h"
#import "EndpointGen.h"
#import "LogFailoverCommand.h"

/**
 * Describes all possible decisions for a log upload strategy.
 */
typedef enum {
    /**
     * Do nothing except adding log record to a storage.
     */
    LOG_UPLOAD_STRATEGY_DECISION_NOOP,
    /**
     * Kaa SDK should initiate log upload on the Operation server.
     */
    LOG_UPLOAD_STRATEGY_DECISION_UPLOAD
} LogUploadStrategyDecision;

/**
 * Interface for log upload strategy.
 *
 * Used by log collector on each adding of the new log record in order to check
 * whether to send logs to server or clean up local storage.
 *
 * Reference implementation used by default <DefaultLogUploadStrategy>
 */
@protocol LogUploadStrategy

/**
 * Retrieves log upload decision based on current storage status and defined
 * upload configuration.
 *
 * Returns upload decision.
 */
- (LogUploadStrategyDecision)isUploadNeeded:(id<LogStorageStatus>)status;

/**
 * Retrieves maximum size of the report pack
 * that will be delivered in single request to server
 * Returns size of the batch
 */
- (NSInteger)getBatchSize;

/**
 * Retrieves maximum count of the records in report pack
 * that will be delivered in single request to server
 * Returns size of the batch
 */
- (NSInteger)getBatchCount;

/**
 * Maximum time to wait log delivery response.
 * Returns time in seconds.
 */
- (NSInteger)getTimeout;

/**
 * If there are records in storage we need to periodically check isUploadNeeded method.
 * This is useful if client want to upload logs on certain timing conditions instead of log storage checks
 * Returns time in seconds
 */
- (NSInteger)getUploadCheckPeriod;

/**
 * Handles timeout of log delivery
 */
- (void)onTimeout:(id<LogFailoverCommand>)controller;

/**
 * Handles failure of log delivery
 */
- (void)onFailure:(id<LogFailoverCommand>)controller errorCode:(LogDeliveryErrorCode)code;

@end

#endif
