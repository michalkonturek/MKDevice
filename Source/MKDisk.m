//
//  MKDisk.m
//  MKDevice
//
//  Created by Michal Konturek on 27/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKDisk.h"

#import "NSNumber+MK_Manipulation.h"

@implementation MKDisk

+ (NSNumber *)usedDiskSpaceInBytes {
    return [[self totalDiskSpaceInBytes] mk_subtract:[self freeDiskSpaceInBytes]];
}

+ (NSNumber *)freeDiskSpaceInBytes {
    return [[self _fileSystemAttributes] objectForKey:NSFileSystemFreeSize];
}

+ (NSNumber *)totalDiskSpaceInBytes {
    return [[self _fileSystemAttributes] objectForKey:NSFileSystemSize];
}

+ (NSDictionary *)_fileSystemAttributes {
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *attributes = [[NSFileManager defaultManager]
                                attributesOfFileSystemForPath:[paths lastObject] error: &error];
    
    if (error) NSLog(@"ERROR: Domain = %@, Code = %@", [error domain], @([error code]));
    
    return attributes;
}

@end
