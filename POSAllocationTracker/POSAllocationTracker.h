//
//  POSAllocationTracker.h
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import "NSObject+POSAllocationTracker.h"

@interface POSAllocationTracker : NSObject

#if POS_ENABLE_RUNTIME_CHECKS
+ (uint64_t)instanceCountForClass:(Class)aClass;
+ (void)resetAllCounters;
#endif

@end


