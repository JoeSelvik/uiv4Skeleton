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

typedef NS_ENUM(NSInteger, TNTMapViewControllerState) {
    TNTMapViewControllerStateDragForPickup,
    TNTMapViewControllerStateDraggedForPickup,
    TNTMapViewControllerStateDragForDropoff,
    TNTMapViewControllerStateDraggedForDropoff,
    TNTMapViewControllerStateContactingDispatch
};

@interface MapViewController ()

@property (assign, nonatomic) TNTMapViewControllerState state;

@property (weak, nonatomic) IBOutlet UIView *topContainer;
@property (weak, nonatomic) IBOutlet UIView *mapContainer;
@property (weak, nonatomic) IBOutlet UIView *bottomContainer;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContainerHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomContainerHeightConstraint;


- (void)didUpdateState;


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
    // Grab the locationSelectionVC from the SB and set it up
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LocationSelectionViewController *locationSelectionVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"locationSelectionVC"];
    locationSelectionVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Setup the VC, then Views heirarchy
    [self addChildViewController:locationSelectionVC];
    [self.bottomContainer addSubview:locationSelectionVC.view];
    
    // The locationSelectionVC need to be constrained to the bottom view container
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
    
    // Needed to finish the setup?
    [locationSelectionVC didMoveToParentViewController:self];
}

@end
