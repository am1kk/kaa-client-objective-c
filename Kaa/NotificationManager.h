//
//  NotificationManager.h
//  Kaa
//
//  Created by Anton Bohomol on 8/26/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#ifndef Kaa_NotificationManager_h
#define Kaa_NotificationManager_h

#import <Foundation/Foundation.h>
#import "NotificationTopicListDelegate.h"
#import "NotificationCommon.h"

/**
 * Interface for the notification delivery system.
 *
 * Responsible for processing received topic/notification updates, subscribing
 * for optional topic updates and unsubscribing from them.
 *
 * @see AbstractNotificationListener
 * @see NotificationTopicListDelegate
 */
@protocol NotificationManager

/**
 * Add delegate for notification topics' list updates.
 *
 * @param delegate the delegate to receive updates.
 * @see NotificationTopicListDelegate
 */
- (void)addTopicListDelegate:(id<NotificationTopicListDelegate>)delegate;

/**
 * Remove delegate of notification topics' list updates.
 *
 * @param delegate delegate the delegate which is no longer needs updates.
 * @see NotificationTopicListDelegate
 */
- (void)removeTopicListDelegate:(id<NotificationTopicListDelegate>)delegate;

/**
 * Retrieve a list of available notification topics.
 *
 * @return list of available topics <Topic>
 * @see Topic
 */
- (NSArray *)getTopics;

/**
 * Add delegate to receive all notifications (both for mandatory and
 * optional topics).
 *
 * @param delegate delegate to receive notifications
 */
- (void)addNotificationDelegate:(id<NotificationDelegate>)delegate;

/**
 * Add listener to receive notifications relating to the specified topic.
 *
 * Listener(s) for optional topics may be added/removed irrespective to
 * whether subscription was already or not.
 *
 * @param delegate delegate to receive notifications.
 * @param topicId Id of topic (both mandatory and optional).
 *
 * @throws UnavailableTopicException if unknown topic id is provided.
 */
- (void)addNotificationDelegate:(id<NotificationDelegate>)delegate forTopic:(NSString *)topicId;

/**
 * Remove listener receiving all notifications (both for mandatory and optional topics).
 *
 * @param delegate delegate to receive notifications
 */
- (void)removeNotificationDelegate:(id<NotificationDelegate>)delegate;

/**
 * Remove delegate receiving notifications for the specified topic.
 *
 * Delegate(s) for optional topics may be added/removed irrespective to
 * whether subscription was already or not.
 *
 * @param delegate delegate to receive notifications.
 * @param topicId Id of topic (both mandatory and optional).
 *
 * @throws UnavailableTopicException if unknown topic id is provided.
 */
- (void)removeNotificationDelegate:(id<NotificationDelegate>)delegate forTopic:(NSString *)topicId;

/**
 * Subscribe to notifications relating to the specified optional topic.
 *
 * @param topicId Id of a optional topic.
 * @param forceSync Define whether current subscription update should be accepted immediately (#sync)
 *
 * @throws UnavailableTopicException if unknown topic id is provided or topic isn't optional.
 *
 * @see #sync
 */
- (void)subscribeToTopic:(NSString *)topicId forceSync:(BOOL)forceSync;

/**
 * Subscribe to notifications relating to the specified list of optional topics.
 *
 * @param topicIds list of optional topic ids. <NSString>
 * @param forceSync define whether current subscription update should be accepted immediately (#sync)
 *
 * @throws UnavailableTopicException if unknown topic id is provided or topic isn't optional.
 *
 * @see #sync
 */
- (void)subscribeToTopics:(NSArray *)topicIds forceSync:(BOOL)forceSync;

/**
 * Unsubscribe from notifications relating to the specified optional topic.
 *
 * All previously added listeners will be removed automatically.
 *
 * @param topicId Id of a optional topic.
 * @param forceSync define whether current subscription update should be accepted immediately (#sync).
 *
 * @throws UnavailableTopicException if unknown topic id is provided or topic isn't optional.
 *
 * @see #sync
 */
- (void)unsubscribeFromTopic:(NSString *)topicId forceSync:(BOOL)forceSync;

/**
 * Unsubscribe from notifications relating to the specified list of optional topics.
 *
 * All previously added listeners will be removed automatically.
 *
 * @param topicIds list of optional topic ids. <NSString>
 * @param forceSync define whether current subscription update should be accepted immediately (#sync).
 *
 * @throws UnavailableTopicException if unknown topic id is provided or topic isn't optional.
 *
 * @see #sync
 */
- (void)unsubscribeFromTopics:(NSArray *)topicIds forceSync:(BOOL)forceSync;

/**
 * Accept optional subscription changes.
 */
- (void)sync;

@end

#endif
