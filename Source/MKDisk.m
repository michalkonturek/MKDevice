//
//  MKDisk.m
//  MKDevice
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
