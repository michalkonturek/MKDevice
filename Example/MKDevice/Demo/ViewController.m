//
//  ViewController.m
//  MKDevice
//
//  Created by Michal Konturek on 18/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "ViewController.h"

#import "MKMemory.h"
#import "MKDisk.h"
#import "MKProcessInfo.h"
#import "MKProcessor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onAction:(id)sender {
    NSLog(@"Memory Free: %@", [MKMemory freeMemory]);
    NSLog(@"Memory Used: %@", [MKMemory usedMemory]);
    NSLog(@"Memory Total: %@", [MKMemory totalMemory]);
    
    NSLog(@"Disk Total: %@", [MKDisk totalDiskSpaceInBytes]);
    NSLog(@"Disk Free: %@", [MKDisk freeDiskSpaceInBytes]);
    NSLog(@"Disk Used: %@", [MKDisk usedDiskSpaceInBytes]);
    
    NSLog(@"Active Processes: %@", @([MKProcessInfo activeProcessesCount]));
//    for (MKProcessInfo *process in [MKProcessInfo activeProcesses]) {
//        NSLog(@"%@ : %@", process.ID, process.name);
//    }
    
    NSLog(@"App CPU usage: %@", [MKProcessor appUsageCPU]);
    NSLog(@"App CPU usage: %@", @([MKProcessor usageCPU]));
    
    
}

@end
