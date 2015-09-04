//
//  NSObject+POSAllocationTracker.m
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import "NSObject+POSAllocationTracker.h"
#import "AllocationTracker.h"
#import <objc/runtime.h>

#ifndef POS_DISABLE_ALLOCATION_TRACKING

@implementation NSObject (POSAllocationTracker)

+ (void)load {
    Method originalDealloc = class_getInstanceMethod(self, sel_getUid("dealloc"));
    NSParameterAssert(originalDealloc != NULL);
    Method trackingDealloc = class_getInstanceMethod(self, @selector(pos_trackingDealloc));
    method_exchangeImplementations(originalDealloc, trackingDealloc);
}

+ (id)pos_trackingAlloc {
    id object = [self alloc];
    pos::AllocationTracker::tracker().incrementInstanceCountForClass(self);
    return object;
}

- (void)pos_trackingDealloc {
    pos::AllocationTracker::tracker().decrementInstanceCountForClass([self class]);
    [self pos_trackingDealloc];
}

@end

#endif
