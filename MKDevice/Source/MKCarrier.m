//
//  MKCarrier.m
//  MKDevice
//
//  Created by Michal Konturek on 19/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKCarrier.h"

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation MKCarrier

+ (BOOL)allowsVOIP {
    return [[self _carrier] allowsVOIP];
}

+ (NSString *)carrierName {
    return [[self _carrier] carrierName];
}

+ (NSString *)isoCountryCode {
    return [[self _carrier] isoCountryCode];
}

+ (NSString *)mobileCountryCode {
    return [[self _carrier] mobileCountryCode];
}

+ (NSString *)mobileNetworkCode {
    return [[self _carrier] mobileNetworkCode];
}

+ (CTCarrier *)_carrier {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return carrier;
}

@end
