//
//  MKDeviceModel.m
//  MKDevice
//
//  Created by Michal Konturek on 29/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKDeviceModel.h"

#import "MKMacro_Method.h"

#import "NSArray+MK_Block.h"

static NSMutableArray *models = nil;

@implementation MKDeviceModel

+ (void)initialize {
    if (!models) models = [NSMutableArray array];
 
    id path = [[NSBundle mainBundle] URLForResource:@"iPhone5s" withExtension:@"json"];
    id data = [NSData dataWithContentsOfURL:path];
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    [models addObject:[self createWithJSON:json]];
}

+ (instancetype)modelForID:(NSString *)ID {
    return [models MK_match:^BOOL(id item) {
        return [[item modelID] isEqualToString:ID];
    }];
}

+ (instancetype)createWithJSON:(id)json {
    return [[self alloc] initWithJSON:json];
}

- (instancetype)initWithJSON:(id)json {
    if (self = [super init]) {
        _modelID = [json objectForKey:@"modelID"];
        _modelName = [json objectForKey:@"modelName"];
        
        _chipCPU = [json objectForKey:@"chipCPU"];
        _chipGPU = [json objectForKey:@"chipGPU"];
        
        _batteryTimeForAudioPlayback = [json objectForKey:@"batteryTimeForAudioPlayback"];
        _batteryTimeForVideoPlayback = [json objectForKey:@"batteryTimeForVideoPlayback"];
        _batteryTimeForStandby = [json objectForKey:@"batteryTimeForStandby"];
        
        _batteryTimeForInternetOn3G = [json objectForKey:@"batteryTimeForInternetOn3G"];
        _batteryTimeForInternetOnLTE = [json objectForKey:@"batteryTimeForInternetOnLTE"];
        _batteryTimeForInternetOnWiFi = [json objectForKey:@"batteryTimeForInternetOnWiFi"];
        
        _batteryTimeForTalkOn2G = [json objectForKey:@"batteryTimeForTalkOn2G"];
        _batteryTimeForTalkOn3G = [json objectForKey:@"batteryTimeForTalkOn3G"];
        _batteryTimeForTalkOnLTE = [json objectForKey:@"batteryTimeForTalkOnLTE"];
    }
    
    return self;
}

- (instancetype)init {
    METHOD_USE_DESIGNATED_INIT
}

@end
