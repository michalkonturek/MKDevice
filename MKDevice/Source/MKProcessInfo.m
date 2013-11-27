//
//  MKProcessInfo.m
//  MKDevice
//
//  Created by Michal Konturek on 26/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKProcessInfo.h"

#import <mach/mach.h>
#import <sys/sysctl.h>

#import "MKMacros.h"
#import "MKProcessInfo.h"


@implementation MKProcessInfo

+ (NSArray *)activeProcesses {
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    u_int miblen = 4;
    size_t size;
    int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    do {
        
        size += size / 10;
        newprocess = realloc(process, size);
        if (!newprocess) {
            if (process) {
                free(process);
            }
            return nil;
        }
        process = newprocess;
        st = sysctl(mib, miblen, process, &size, NULL, 0);
        
    } while (st == -1 && errno == ENOMEM);
    
    if (st == 0) {
        if (size % sizeof(struct kinfo_proc) == 0){
            long nprocess = (size / sizeof(struct kinfo_proc));
            if (nprocess) {
                NSMutableArray *result = [NSMutableArray array];
                for (long i = nprocess - 1; i >= 0; i--) {

                    NSString *processID = [NSString stringWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString *processName = [NSString stringWithFormat:@"%s", process[i].kp_proc.p_comm];
                    
                    MKProcessInfo *process = [MKProcessInfo  createWithID:processID
                                                         withName:processName];
                    [result addObject:process];
                }
                
                free(process);
                return result;
            }
        }
    }
    
    return nil;
}

+ (NSInteger)activeProcessesCount {
    return [[self activeProcesses] count];
}

+ (instancetype)createWithID:(NSString *)ID withName:(NSString *)name {
    return [[self alloc] initWithID:ID withName:name];
}

- (instancetype)initWithID:(NSString *)ID withName:(NSString *)name {
    if (self = [super init]) {
        _ID = ID;
        _name = name;
    }
    return self;
}

@end
