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
    
    UIView *box = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    [self.bottomContainer addSubview:box];
    
//    [self.bottomContainer addConstraint:[NSLayoutConstraint constraintWithItem:locationBarVC.view
//                                                          attribute:NSLayoutAttributeLeading
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:locationBarVC.view.superview
//                                                          attribute:NSLayoutAttributeLeading
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//    
//    [self.bottomContainer addConstraint:[NSLayoutConstraint constraintWithItem:locationBarVC.view
//                                                          attribute:NSLayoutAttributeTop
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.topLayoutGuide
//                                                          attribute:NSLayoutAttributeLeading
//                                                         multiplier:1.0
//                                                           constant:self.navigationController.view.frame.size.height]];
//    
//    [self.bottomContainer addConstraint:[NSLayoutConstraint constraintWithItem:locationBarVC.view
//                                                          attribute:NSLayoutAttributeTrailing
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:locationBarVC.view.superview
//                                                          attribute:NSLayoutAttributeTrailing
//                                                         multiplier:1.0
//                                                           constant:0.0]];
    
}


@end
