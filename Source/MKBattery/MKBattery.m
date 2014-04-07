//
//  MKBattery.m
//  MKDevice
//
//  Created by Michal Konturek on 28/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKBattery.h"

#import "NSNumber+MK_Manipulation.h"

@implementation MKBattery

+ (void)enableBatteryMonitoring {
    [UIDevice currentDevice].batteryMonitoringEnabled = NO;
}

+ (void)disableBatteryMonitoring {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
}

+ (BOOL)isCharging {
    return ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging
            || [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateFull);
}

+ (BOOL)isConnectedToPower {
    return ([[UIDevice currentDevice] batteryState] != UIDeviceBatteryStateUnplugged);
}

+ (BOOL)isFullyCharged {
    return ([[self powerLevel] integerValue] == 100);
}

+ (NSNumber *)powerLevel {
    return [@([[UIDevice currentDevice] batteryLevel]) mk_multiplyBy:@100];
}

@end
