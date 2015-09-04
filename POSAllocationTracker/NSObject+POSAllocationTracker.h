//
//  NSObject+POSAllocationTracker.h
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef POS_DISABLE_ALLOCATION_TRACKING

@interface NSObject (POSAllocationTracker)

+ (id)pos_trackingAlloc;

@end

#else
#   define pos_trackingAlloc alloc
#endif