//
//  DefaultConfigurationTransport.h
//  Kaa
//
//  Created by Anton Bohomol on 9/15/15.
//  Copyright (c) 2015 CYBERVISION INC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractKaaTransport.h"
#import "ConfigurationTransport.h"

/**
 * The default implementation of the ConfigurationTransport.
 */
@interface DefaultConfigurationTransport : AbstractKaaTransport <ConfigurationTransport>

@end
