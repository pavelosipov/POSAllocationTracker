//
//  POSAllocationTracker.m
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import "POSAllocationTracker.h"
#import "NSObject+POSAllocationTracker.h"
#import "AllocationTracker.h"
#import <objc/runtime.h>

@implementation POSAllocationTracker

+ (uint64_t)instanceCountForClass:(Class)aClass {
    return pos::AllocationTracker::tracker().instanceCountForClass(aClass);
}

@end
