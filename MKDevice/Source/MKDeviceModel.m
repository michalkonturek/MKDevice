//
//  MKDeviceModel.m
//  MKDevice
//
//  Created by Michal Konturek on 29/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKDeviceModel.h"

#import "MKMacro_Method.h"

@implementation MKDeviceModel

+ (void)initialize {
    
}

+ (instancetype)createWithJSON:(id)json {
    return [[self alloc] initWithJSON:json];
}

- (instancetype)initWithJSON:(id)json {
    if (self = [super init]) {
        _modelID = [json objectForKey:@"modelID"];
        _modelName = [json objectForKey:@"modelName"];
        
        _chipCPU = [json objectForKey:@"chipCPU"];
        _chipGPU = [json objectForKey:@"KEY"];
        
        _batteryTimeForAudioPlayback = [json objectForKey:@"KEY"];
        _batteryTimeForVideoPlayback = [json objectForKey:@"KEY"];
        _batteryTimeForStandby = [json objectForKey:@"KEY"];
        
        _batteryTimeForInternetOn3G = [json objectForKey:@"KEY"];
        _batteryTimeForInternetOnLTE = [json objectForKey:@"KEY"];
        _batteryTimeForInternetOnWiFi = [json objectForKey:@"KEY"];
        
        _batteryTimeForTalkOn2G = [json objectForKey:@"KEY"];
        _batteryTimeForTalkOn3G = [json objectForKey:@"KEY"];
        _batteryTimeForTalkOnLTE = [json objectForKey:@"KEY"];
    }
    
    return self;
}

- (instancetype)init {
    METHOD_USE_DESIGNATED_INIT
}

@end
