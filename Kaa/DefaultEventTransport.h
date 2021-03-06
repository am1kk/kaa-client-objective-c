//
//  DefaultEventTransport.h
//  Kaa
//
//  Created by Anton Bohomol on 9/15/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractKaaTransport.h"
#import "EventTransport.h"

@interface DefaultEventTransport : AbstractKaaTransport <EventTransport>

- (instancetype)initWithState:(id<KaaClientState>)state;

@end
