//
//  MapViewController.m
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/30/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "LocationBarViewController.h"
#import "LocationSelectionViewController.h"
#import "MapViewController.h"

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet UIView *topContainer;
@property (weak, nonatomic) IBOutlet UIView *mapContainer;
@property (weak, nonatomic) IBOutlet UIView *bottomContainer;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContainerHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomContainerHeightConstraint;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self loadBottomContainer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadBottomContainer
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LocationSelectionViewController *locationSelectionVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"locationSelectionVC"];
    locationSelectionVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addChildViewController:locationSelectionVC];
    
    NSLog(@"top container frame: @%@", NSStringFromCGRect(self.topContainer.frame));
    NSLog(@"bottom container frame: @%@", NSStringFromCGRect(self.bottomContainer.frame));
    NSLog(@"location selection frame: @%@", NSStringFromCGRect(locationSelectionVC.view.frame));
    
    [self.bottomContainer addSubview:locationSelectionVC.view];
    NSDictionary *viewsDictionary = @{@"locationBarView":locationSelectionVC.view};
    
    // Leading constraint
    NSArray *constraint_LEADING = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[locationBarView]"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:viewsDictionary];
    [self.bottomContainer addConstraints:constraint_LEADING];
    
    // Top constraint
    NSArray *constraint_TOP = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[locationBarView]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:viewsDictionary];
    [self.bottomContainer addConstraints:constraint_TOP];
    
    // Trailing constraint
    NSArray *constraint_TRAILING = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[locationBarView]-0-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    [self.bottomContainer addConstraints:constraint_TRAILING];
    
    // Bottom constraint
    NSArray *constraint_BOTTOM = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[locationBarView]-0-|"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:viewsDictionary];
    [self.bottomContainer addConstraints:constraint_BOTTOM];
    
    
    [locationSelectionVC didMoveToParentViewController:self];
}

@end
