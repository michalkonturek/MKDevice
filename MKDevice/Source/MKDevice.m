//
//  MKDevice.m
//  MKDevice
//
//  Created by Michal Konturek on 18/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKDevice.h"

#import <AudioToolbox/AudioToolbox.h>
#import <ExternalAccessory/ExternalAccessory.h>

@implementation MKDevice

+ (NSInteger)connectedAccessoriesCount {
    return [[self connectedAccessories] count];
}

+ (NSArray *)connectedAccessories {
    return [[EAAccessoryManager sharedAccessoryManager] connectedAccessories];
}

+ (BOOL)hasAnyAccessoryConnected {
    return ([self connectedAccessoriesCount] != 0);
}

+ (BOOL)isJailbroken {
    
    // source: http://stackoverflow.com/questions/413242/how-do-i-detect-that-an-ios-app-is-running-on-a-jailbroken-phone
    
    FILE *f = fopen("/bin/bash", "r");
    BOOL result = (f != NULL);
    fclose(f);
    
    return result;
}

@end
