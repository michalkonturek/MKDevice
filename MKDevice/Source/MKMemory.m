//
//  MKMemory.m
//  MKDevice
//
//  Created by Michal Konturek on 18/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKMemory.h"

#import <mach/mach.h>
#import <mach/mach_host.h>

#import "MKFoundation.h"

@implementation MKMemory

/*
 source: 
 http://stackoverflow.com/questions/2798638/available-memory-for-iphone-os-app
 http://www.macyourself.com/2010/02/17/what-is-free-wired-active-and-inactive-system-memory-ram/
 http://stackoverflow.com/questions/787160/programmatically-retrieve-memory-usage-on-iphone
 
 http://support.apple.com/kb/TS2419
 */

+ (void)initialize {
    NSLog(@"Free: %@", [self freeMemory]);
    NSLog(@"Total: %@", [self totalMemory]);
}

+ (NSNumber *)activeMemory {
    METHOD_NOT_IMPLEMENTED
}

+ (NSNumber *)inactiveMemory {
    METHOD_NOT_IMPLEMENTED
}

+ (NSNumber *)freeMemory {
    
    vm_statistics_data_t vm_stat;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO, (host_info_t)&vm_stat, &infoCount);
    
    if (kernReturn != KERN_SUCCESS) return @0;
    
    id result = @(vm_stat.free_count * vm_page_size);
    result = [[result MK_divideBy:@1024] MK_divideBy:@1024];
    
    return result;
}

//natural_t  freeMemory(void) {
//    mach_port_t           host_port = mach_host_self();
//    mach_msg_type_number_t   host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
//    vm_size_t               pagesize;
//    vm_statistics_data_t     vm_stat;
//    
//    host_page_size(host_port, &pagesize);
//    
//    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) NSLog(@"Failed to fetch vm statistics");
//    
//    natural_t   mem_used = (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count) * pagesize;
//    natural_t   mem_free = vm_stat.free_count * pagesize;
//    natural_t   mem_total = mem_used + mem_free;
//    
//    return mem_free;
//}


+ (NSNumber *)totalMemory {
    id total_bytes = @([[NSProcessInfo processInfo] physicalMemory]);
    id total_kilobytes = [total_bytes MK_divideBy:@1024];
    return [total_kilobytes MK_divideBy:@1024];
}

+ (NSNumber *)usedMemory {
    METHOD_NOT_IMPLEMENTED
}

+ (NSNumber *)wiredMemory {
    METHOD_NOT_IMPLEMENTED
}

@end
