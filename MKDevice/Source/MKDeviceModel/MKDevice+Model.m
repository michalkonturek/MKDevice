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


//+ (NSString *)deviceTypeString {
//    NSString *platform = [self modelIdentifier];
//    
//    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
//    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4 CDMA";
//    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
//    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
//    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
//    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 WiFi";
//    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 GSM";
//    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 CDMA";
//    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 CDMAS";
//    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini Wifi";
//    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (Wi-Fi + Cellular)";
//    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (Wi-Fi + Cellular MM)";
//    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 WiFi";
//    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 CDMA";
//    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 GSM";
//    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 Wifi";
//    if ([platform isEqualToString:@"i386"])         return @"Simulator";
//    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
//    return @"Unknown";
//}


/*
 NOTE: There is a new arlogirthm for system detection.
 source: http://stackoverflow.com/questions/7620229/how-can-i-get-iphone-device-type
 */

+ (NSString *)modelIdentifier {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:(char *)machine];   // [NSString stringWithCString:machine];
    free(machine);
    return platform;
}


@end