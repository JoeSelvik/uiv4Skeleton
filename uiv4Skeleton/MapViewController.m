//
//  MapViewController.m
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/30/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "LocationBarViewController.h"
#import "MapViewController.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UIView *topContainer;
@property (weak, nonatomic) IBOutlet UIView *mapContainer;
@property (weak, nonatomic) IBOutlet UIView *bottomContainer;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadTopContainer
{
    
}

- (void)loadBottomContainer
{
    // Grab the locationBar and button
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LocationBarViewController *locationBarVC = [main instantiateViewControllerWithIdentifier:@"locationBarVC"];
    
    [self.bottomContainer addSubview:locationBarVC.view];
    
}


@end
