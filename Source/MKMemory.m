//
//  MKMemory.m
//  MKDevice
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "MKMemory.h"

#import <mach/mach.h>
#import <mach/mach_host.h>

#import <MKFoundationKit/MKFoundationKit.h>

@implementation MKMemory

/*
 source: 
 http://stackoverflow.com/questions/2798638/available-memory-for-iphone-os-app
 http://www.macyourself.com/2010/02/17/what-is-free-wired-active-and-inactive-system-memory-ram/
 http://stackoverflow.com/questions/787160/programmatically-retrieve-memory-usage-on-iphone
 
 http://support.apple.com/kb/TS2419
 
 http://stackoverflow.com/questions/1563935/how-to-display-iphone-free-memory-and-how-to-free-iphone-memory?lq=1
 */

+ (void)initialize {
//    NSLog(@"Free: %@", [self freeMemory]);
//    NSLog(@"Total: %@", [self totalMemory]);
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
    result = [[result mk_divideBy:@1024] mk_divideBy:@1024];
    
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
    id total_kilobytes = [total_bytes mk_divideBy:@1024];
    return [total_kilobytes mk_divideBy:@1024];
}

+ (NSNumber *)usedMemory {
    double usedMemory = 0.00;
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return @0;
    }
    usedMemory = ((vm_page_size * (vmStats.active_count + vmStats.inactive_count + vmStats.wire_count)) / 1024) / 1024;
    
    return @(usedMemory);
}

+ (NSNumber *)wiredMemory {
    METHOD_NOT_IMPLEMENTED
}

@end
