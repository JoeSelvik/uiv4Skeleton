//
//  ViewController.m
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/19/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"pickupBarView constraints: %@", [self.pickupBarView constraints]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
