//
//  MKDevice+Model.m
//  MKDevice
//
//  Created by Michal Konturek on 29/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKDevice+Model.h"

#include <sys/types.h>
#include <sys/sysctl.h>

@implementation MKDevice (Model)

+ (NSString *)deviceModelString {
    return [[self deviceModel] description];
}

+ (NSString *)deviceType {
    return [[self deviceModel] type];
}

+ (MKDeviceModel *)deviceModel {
    NSString *identifier = [self modelIdentifier];
    return [MKDeviceModel modelForIdentifier:identifier];
}

+ (NSString *)modelIdentifier {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:(char *)machine];
    free(machine);
    return platform;
}


@end
