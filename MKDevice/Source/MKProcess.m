//
//  MKProcess.m
//  MKDevice
//
//  Created by Michal Konturek on 26/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKProcess.h"

#import "MKMacros.h"

@implementation MKProcess

+ (NSArray *)activeProcesses {
    METHOD_NOT_IMPLEMENTED
}

+ (NSInteger)activeProcessesCount {
    return [[self activeProcesses] count];
}

+ (instancetype)createWithID:(NSString *)ID withName:(NSString *)name {
    return [[self alloc] initWithID:ID withName:name];
}

- (instancetype)initWithID:(NSString *)ID withName:(NSString *)name {
    if (self = [super init]) {
        _ID = ID;
        _name = name;
    }
    return self;
}

@end
