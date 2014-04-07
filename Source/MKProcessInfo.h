//
//  MKProcessInfo.h
//  MKDevice
//
//  Created by Michal Konturek on 26/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKProcessInfo : NSObject

+ (NSArray *)activeProcesses;
+ (NSInteger)activeProcessesCount;

+ (instancetype)createWithID:(NSString *)ID withName:(NSString *)name;

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithID:(NSString *)ID withName:(NSString *)name;

@end
