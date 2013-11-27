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
#import "MKProcess.h"

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
    
    NSLog(@"Active Processes: %@", @([MKProcess activeProcessesCount]));
    for (MKProcess *process in [MKProcess activeProcesses]) {
        NSLog(@"%@ : %@", process.ID, process.name);
    }
    
    NSProcessInfo
}


@end
