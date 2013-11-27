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
    return [[self totalDiskSpaceInBytes] MK_subtract:[self totalDiskSpaceInBytes]];
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



//+ (NSNumber *)getFreeDiskspace {
//    
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSDictionary *attributes = [[NSFileManager defaultManager]
//                                attributesOfFileSystemForPath:[paths lastObject] error: &error];
//    
//    if (!attributes) return @-1;
//    
//    NSNumber *fileSystemSizeInBytes = [attributes objectForKey:NSFileSystemSize];
//    NSNumber *freeFileSystemSizeInBytes = [attributes objectForKey:NSFileSystemFreeSize];
//    
//    NSLog(@"Total: %@ Free: %@", fileSystemSizeInBytes, freeFileSystemSizeInBytes);
//    
//    return freeFileSystemSizeInBytes;
//}


@end
