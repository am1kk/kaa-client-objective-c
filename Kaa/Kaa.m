//
//  Kaa.m
//  Kaa
//
//  Created by Anton Bohomol on 5/26/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#import "Kaa.h"
#import "KaaLogging.h"
#import "BaseKaaClient.h"

#define TAG @"Kaa >>>"

@implementation Kaa

+ (id<KaaClient>)clientWithContext:(id<KaaClientPlatformContext>)context andStateDelegate:(id<KaaClientStateDelegate>)delegate {
    @try {
        return [[BaseKaaClient alloc] initWithPlatformContext:context andDelegate:delegate];
    }
    @catch (NSException *exception) {
        DDLogError(@"%@ Failed to create Kaa client: %@. Reason: %@", TAG, exception.name, exception.reason);
        [NSException raise:@"KaaInvalidConfigurationException" format:@"%@:%@", exception.name, exception.reason];
    }
}

+ (id<KaaClient>)clientWithContext:(id<KaaClientPlatformContext>)context {
    return [self clientWithContext:context andStateDelegate:nil];
}

@end
