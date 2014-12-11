//
//  LocationSelectionViewController.m
//  uiv4Skeleton
//
//  Created by Joe Selvik on 12/1/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "LocationSelectionViewController.h"

@interface LocationSelectionViewController ()

@property (weak, nonatomic) IBOutlet UIView *locationBarView;

@property (weak, nonatomic) IBOutlet UIView *pickupBarView;
@property (weak, nonatomic) IBOutlet UILabel *pickupBarLabel;

@property (weak, nonatomic) IBOutlet UIView *dropoffBarView;
@property (weak, nonatomic) IBOutlet UILabel *dropoffBarLabel;

@property (weak, nonatomic) IBOutlet UIButton *locationButton;
- (IBAction)tappedLocationButton:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *locationBarSlideConstraint;
@property (nonatomic, assign) BOOL pickupBarSelected;

@end

@implementation LocationSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup the locationBar with correct gesture recognizers
    UITapGestureRecognizer *tapDropoffBarView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRight:)];
    UITapGestureRecognizer *tapPickupBarView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLeft:)];
    
    [self.dropoffBarView addGestureRecognizer:tapDropoffBarView];
    [self.pickupBarView addGestureRecognizer:tapPickupBarView];
    
    self.pickupBarLabel.contentMode = UIViewContentModeScaleToFill;
    self.dropoffBarLabel.contentMode = UIViewContentModeScaleToFill;
    
    self.pickupBarSelected = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)enableButton
{
    self.locationButton.enabled = YES;
}

- (void)disableButton
{
    self.locationButton.enabled = NO;
}

- (void)setButtonTitle:(NSString *)title
{
    [self.locationButton setTitle:title forState:UIControlStateNormal];
}


- (IBAction)handleLocationButton:(id)sender
{
    // Get the mapVC
    id<LocationSelectionViewControllerDelegate> strongDelegate = self.delegate;
    MapViewController *mapVC = (MapViewController*)strongDelegate;
    
    if ([mapVC mapVCState] == TNTMapViewControllerStateDraggedForPickup ) {
        [self animateToDragForDropoffState];
    } else if ( [mapVC mapVCState] == TNTMapViewControllerStateDraggedForDropoff ) {
        // [self animateToContactingDispatchState];
    } else {
        // Should not be possible!
    }
    
}

// Put any functionality here that needs the tapRecognizer
- (void)tapRight:(UITapGestureRecognizer *)tapRecognizer
{
    [self animateToDragForDropoffState];
}

// There are multiple ways to change state though
- (void)animateToDragForDropoffState
{
    if (self.pickupBarSelected) {
        // The multiplier is readonly so to modify this constraint we need to replace it with a new, updated constraint.
        [self.locationBarView removeConstraint:self.locationBarSlideConstraint];
        self.locationBarSlideConstraint = [NSLayoutConstraint constraintWithItem:self.pickupBarView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.locationBarView
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:0.8
                                                                        constant:0.0
                                           ];
        [self.locationBarView addConstraint:self.locationBarSlideConstraint];
        
        // Animate the location bar.
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             [self.locationBarView layoutIfNeeded];
                         }
                         completion:nil
         ];
        
        // Update the state.
        id<LocationSelectionViewControllerDelegate> strongDelegate = self.delegate;
        
        if ([strongDelegate respondsToSelector:@selector(locationSelectionVC:movedToNextState:)]) {
            [strongDelegate locationSelectionVC:self movedToNextState:TNTMapViewControllerStateDraggedForDropoff];
        }
        
        // Protects against double taps.
        self.pickupBarSelected = NO;
    }
}

@end
