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
    
    [self loadBottomContainer];
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
    locationBarVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.bottomContainer addSubview:locationBarVC.view];
    NSDictionary *viewsDictionary = @{@"locationBarView":locationBarVC.view};
    
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
    
    // Height constraint
    NSArray *constraint_HEIGHT = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[locationBarView(80)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:viewsDictionary];
    [locationBarVC.view addConstraints:constraint_HEIGHT];
    
    
}


@end
