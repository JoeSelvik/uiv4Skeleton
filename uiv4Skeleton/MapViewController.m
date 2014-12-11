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

@property (assign, nonatomic) TNTMapViewControllerState state;

@property (weak, nonatomic) IBOutlet UIView *topContainer;
@property (weak, nonatomic) IBOutlet UIView *mapContainer;
@property (weak, nonatomic) IBOutlet UIView *bottomContainer;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContainerHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomContainerHeightConstraint;

@property (weak, nonatomic) LocationSelectionViewController *locationSelectionVC;

- (void)didUpdateState;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set our initial state. For demo skip the drag state
    self.state = TNTMapViewControllerStateDraggedForPickup;
    [self didUpdateState];

    [self loadBottomContainer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - State Control

- (TNTMapViewControllerState)mapVCState
{
    return self.state;
}

- (void) setMapVCState:(TNTMapViewControllerState)state
{
    self.state = state;
}

- (void)didUpdateState
{
    switch (self.state) {
        // Initiallized when map gets dragged. Not for this demo app.
        case TNTMapViewControllerStateDragForPickup: {
            [self.locationSelectionVC disableButton];
            [self.locationSelectionVC setButtonTitle:@"Pickup Location"];
            break;
        }
            
        case TNTMapViewControllerStateDraggedForPickup: {
            [self.locationSelectionVC enableButton];
            [self.locationSelectionVC setButtonTitle:@"Pickup Location"];
            break;
        }
            
        case TNTMapViewControllerStateDragForDropoff: {
            [self.locationSelectionVC disableButton];
            [self.locationSelectionVC setButtonTitle:@"Dropoff Location"];
            break;
        }
            
        case TNTMapViewControllerStateDraggedForDropoff: {
            [self.locationSelectionVC disableButton];
            [self.locationSelectionVC setButtonTitle:@"Dropoff Location"];
            break;
        }
            
        case TNTMapViewControllerStateContactingDispatch: {
            break;
        }
    }
}


#pragma mark - Containers

- (void)loadTopContainer
{
    
}

- (void)loadBottomContainer
{
    // Grab the locationSelectionVC from the SB and set it up
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LocationSelectionViewController *locationSelectionVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"locationSelectionVC"];
    locationSelectionVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    locationSelectionVC.delegate = self;
    
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
    
    // Create a pointer to this VC for future use
    self.locationSelectionVC = locationSelectionVC;
}


#pragma mark - LocationSelectionViewControllerDelegate Methods


@end
