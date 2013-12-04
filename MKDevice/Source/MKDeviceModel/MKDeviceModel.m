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

#import "NSString+MK_Empty.h"

static NSMutableArray *models = nil;

@implementation MKDeviceModel

+ (void)initialize {
    if (!models) models = [NSMutableArray array];
    
    NSArray *specs = @[@"iPhone4", @"iPhone4s",
                       @"iPhone5", @"iPhone5c", @"iPhone5s", @"Simulator", @"Unknown"];
    for (id spec in specs) {
        id path = [[NSBundle mainBundle] URLForResource:spec withExtension:@"json"];
        id data = [NSData dataWithContentsOfURL:path];
        
        id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        [models addObject:[self createWithJSON:json]];
    }
}

+ (instancetype)modelForCode:(NSString *)code {
    return [models MK_match:^BOOL(MKDeviceModel *item) {
        return [[item code] isEqualToString:code];
    }];
}

+ (instancetype)modelForIdentifier:(NSString *)identifier {
    id object = [models MK_match:^BOOL(id model) {
        id result = [[model identifiers] MK_match:^BOOL(id item) {
            return [item isEqualToString:identifier];
        }];
        return (result != nil);
    }];

    if (!object) return [self unknown];
    
    [object setIdentifier:identifier];
    return object;
//    return (object) ? object : [self unknown];
}

+ (NSString *)modelStringForIdentifier:(NSString *)identifier {
    return [[self modelForIdentifier:identifier] description];
}

+ (instancetype)simulator {
    return [self modelForCode:@"Simulator"];
}

+ (instancetype)unknown {
    return [self modelForCode:@"Unknown"];
}

+ (instancetype)createWithJSON:(id)json {
    return [[self alloc] initWithJSON:json];
}

- (instancetype)initWithJSON:(id)json {
    if (self = [super init]) {
        _code = [json objectForKey:@"code"];
        _name = [json objectForKey:@"name"];
        _name = [json objectForKey:@"type"];
        _identifier = @"";
        _identifiers = [json objectForKey:@"identifiers"];
        _models = [json objectForKey:@"models"];
        
        _chipCPU = [json objectForKey:@"chipCPU"];
        _chipGPU = [json objectForKey:@"chipGPU"];
        
        _batteryTimeForAudioPlayback = [json objectForKey:@"batteryTimeForAudioPlayback"];
        _batteryTimeForVideoPlayback = [json objectForKey:@"batteryTimeForVideoPlayback"];
        _batteryTimeForStandby = [json objectForKey:@"batteryTimeForStandby"];
        
        _batteryTimeForInternetOn3G = [json objectForKey:@"batteryTimeForInternetOn3G"];
        _batteryTimeForInternetOnLTE = [json objectForKey:@"batteryTimeForInternetOnLTE"];
        _batteryTimeForInternetOnWiFi = [json objectForKey:@"batteryTimeForInternetOnWiFi"];
        
        _batteryTimeForTalkOn3G = [json objectForKey:@"batteryTimeForTalkOn3G"];
    }
    
    return self;
}

- (instancetype)init {
    METHOD_USE_DESIGNATED_INIT
}

- (NSString *)description {
    NSMutableString *result = [NSMutableString stringWithString:self.name];
    
    id version = [self.models objectForKey:self.identifier];
    if (![NSString MK_isStringEmptyOrNil:version]) [result appendFormat:@" %@", version];
    
    return result;
}

@end
