//
//  ViewController.m
//  MKDevice
//
//  Created by Michal Konturek on 18/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "ViewController.h"

#import "MKMemory.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAction:(id)sender {
    NSLog(@"Free: %@", [MKMemory freeMemory]);
    NSLog(@"Used: %@", [MKMemory usedMemory]);
    NSLog(@"Total: %@", [MKMemory totalMemory]);
}

@end
