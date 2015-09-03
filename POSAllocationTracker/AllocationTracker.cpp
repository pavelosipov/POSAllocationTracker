//
//  AllocationTracker.cpp
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#include "AllocationTracker.h"
#include <stdlib.h>
#include <iostream>

namespace pos {

AllocationTracker &AllocationTracker::tracker() {
    // This is thread safe in C++11 according to section 6.7:
    // "If control enters the declaration concurrently while
    // the object is being initialized, the concurrent execution
    // waits for completion of the initialization."
    // http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2008/n2660.htm#LocalDecl
    static AllocationTracker tracker;
    return tracker;
}

AllocationTracker::AllocationTracker() {}
    
void AllocationTracker::incrementInstanceCountForClass(Class aClass) {
    std::cout << "++" << class_getName(aClass) << std::endl;
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    ++snapshot_[aClass];
}

void AllocationTracker::decrementInstanceCountForClass(Class aClass) {
    std::cout << "--" << class_getName(aClass) << std::endl;
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    --snapshot_[aClass];
}
    
AllocationTracker::Snapshot const &AllocationTracker::snapshot() const {
    return snapshot_;
}

}
