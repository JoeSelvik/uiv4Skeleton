//
//  ViewController.m
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/19/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, TNTMapViewControllerState) {
    TNTMapViewControllerStateDragForPickup,
    TNTMapViewControllerStateDraggedForPickup,
    TNTMapViewControllerStateDragForDropoff,
    TNTMapViewControllerStateDraggedForDropoff,
    TNTMapViewControllerStateContactingDispatch
};

@interface ViewController ()

@property (assign, nonatomic) TNTMapViewControllerState state;

@property (weak, nonatomic) IBOutlet UIView *locationBarView;
@property (weak, nonatomic) IBOutlet UIView *pickupBarView;
@property (weak, nonatomic) IBOutlet UILabel *pickupBarLabel;
@property (weak, nonatomic) IBOutlet UIView *dropoffBarView;
@property (weak, nonatomic) IBOutlet UILabel *dropoffBarLabel;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *locationBarSlideConstraint;
@property (nonatomic, assign) BOOL pickupBarSelected;

- (void)didUpdateState;
- (IBAction)tappedLocationButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set the initial state. In this demo skip the drag state.
    self.state = TNTMapViewControllerStateDraggedForPickup;
    [self didUpdateState];
    
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

#pragma mark - State

- (void)didUpdateState
{
    switch (self.state) {
        // Initiallized when map gets dragged. Not for this shell.
        case TNTMapViewControllerStateDragForPickup: {
            self.locationButton.enabled = NO;
            [self.locationButton setTitle:@"Pickup Location" forState:UIControlStateNormal];
            break;
        }
            
        case TNTMapViewControllerStateDraggedForPickup: {
            self.locationButton.enabled = YES;
            [self.locationButton setTitle:@"Pickup Location" forState:UIControlStateNormal];
            break;
        }
        
        case TNTMapViewControllerStateDragForDropoff: {
            self.locationButton.enabled = NO;
            [self.locationButton setTitle:@"Dropoff Location" forState:UIControlStateNormal];
            break;
        }
        
        case TNTMapViewControllerStateDraggedForDropoff: {
            self.locationButton.enabled = YES;
            [self.locationButton setTitle:@"Dropoff Location" forState:UIControlStateNormal];
            break;
        }
        
        case TNTMapViewControllerStateContactingDispatch: {
            break;
        }
    }
}

- (IBAction)tappedLocationButton:(id)sender
{
    if (self.state == TNTMapViewControllerStateDraggedForPickup) {
        [self animateToDragForDropoffState];
    } else if (self.state == TNTMapViewControllerStateDraggedForDropoff) {
        [self animateToContactingDispatchState];
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
        self.state = TNTMapViewControllerStateDraggedForDropoff;
        [self didUpdateState];
        
        // Protects against double taps.
        self.pickupBarSelected = NO;
    }
}


// Put any functionality here that needs the tapRecognizer
- (void)tapLeft:(UITapGestureRecognizer *)tapRecognizer
{
    [self animateToDragForPickupState];
}


// Put any functionality here that needs the tapRecognizer
- (void)animateToDragForPickupState
{
    if (!self.pickupBarSelected) {
        // The multiplier is readonly so to modify this constraint we need to replace it with a new, updated constraint.
        [self.locationBarView removeConstraint:self.locationBarSlideConstraint];
        self.locationBarSlideConstraint = [NSLayoutConstraint constraintWithItem:self.pickupBarView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.locationBarView
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1.2
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
        self.state = TNTMapViewControllerStateDraggedForPickup;
        [self didUpdateState];
        
        // Protects against double taps.
        self.pickupBarSelected = YES;
    }
}


- (void)animateToContactingDispatchState
{
    // Animate the locationBar away!
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self.locationBarView removeFromSuperview];
                     }
                     completion:nil
     ];
    
    // Update the state.
    self.state = TNTMapViewControllerStateContactingDispatch;
    [self didUpdateState];
}

@end
