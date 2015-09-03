//
//  NSObject+POSAllocationTracker.m
//  POSAllocationTracker
//
//  Created by Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#import "NSObject+POSAllocationTracker.h"
#import "AllocationTracker.h"
#import <objc/runtime.h>
#import <iostream>

@implementation NSObject (POSAllocationTracker)

+ (void)load {
    Method originalAlloc = class_getClassMethod(self, @selector(alloc));
    Method originalDealloc = class_getInstanceMethod(self, sel_getUid("dealloc"));
    if (originalAlloc != NULL && originalDealloc != NULL) {
        Method trackingAlloc = class_getClassMethod(self, @selector(pos_trackingAlloc));
        Method trackingDealloc = class_getInstanceMethod(self, @selector(pos_trackingDealloc));
        method_exchangeImplementations(originalAlloc, trackingAlloc);
        method_exchangeImplementations(originalDealloc, trackingDealloc);
    }
}

+ (id)pos_trackingAlloc {
    id object = [self pos_trackingAlloc];
    pos::AllocationTracker::tracker().incrementInstanceCountForClass(self);
    return object;
}

- (void)pos_trackingDealloc {
    pos::AllocationTracker::tracker().decrementInstanceCountForClass([self class]);
    [self pos_trackingDealloc];
}

@end
