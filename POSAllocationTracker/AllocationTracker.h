//
//  AllocationTracker.h
//  POSAllocationTracker
//
//  Created by Pavel Osipov on 03.09.15.
//  Copyright (c) 2015 Pavel Osipov. All rights reserved.
//

#pragma once

#include <atomic>
#include <mutex>
#include <unordered_map>
#include <objc/runtime.h>

#if __cplusplus <= 199711L
#   error This library needs at least a C++11 compliant compiler
#endif

namespace pos {

class AllocationTracker {
public:
    typedef std::unordered_map<Class, uint64_t> Snapshot;
    
    AllocationTracker(const AllocationTracker&) = delete;
    AllocationTracker& operator=(const AllocationTracker&) = delete;
    
    static AllocationTracker &tracker();
    
    uint64_t instanceCountForClass(Class aClass);
    void incrementInstanceCountForClass(Class aClass);
    void decrementInstanceCountForClass(Class aCls);
        
private:
    AllocationTracker();
    static Snapshot buildInitialSnapshot();
    
private:
    std::mutex snapshotMutex_;
    Snapshot snapshot_;
};

}
