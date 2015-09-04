//
//  POSAllocationTracker.h
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#if !defined(POS_DISABLE_ALLOCATION_TRACKING) && !defined(DEBUG)
#   define POS_DISABLE_ALLOCATION_TRACKING
#endif

#import "NSObject+POSAllocationTracker.h"

@interface POSAllocationTracker : NSObject

+ (uint64_t)instanceCountForClass:(Class)aClass;

@end
