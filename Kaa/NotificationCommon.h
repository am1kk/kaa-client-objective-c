/*
 * Copyright 2014 CyberVision, Inc.
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

#import <Foundation/Foundation.h>
#import "EndpointGen.h"
#import "KAANotification.h"

@protocol NotificationDelegate

/**
 * Called on each new notification.
 */
- (void)onNotification:(KAANotification *)notification withTopicId:(NSString *)topicId;

@end

/**
 * This class deserialize binary data to notification object.
 *
 * Implementation is auto-generated. Please modify corresponding template file.
 */
@interface NotificationDeserializer : NSObject

/**
 * delegates - array of delegates to be notified <NotificationDelegate>
 */
- (void)notify:(NSArray *)delegates topic:(Topic *)topic data:(NSData *)notificationData;

@end