//
//  ViewController.m
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/19/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *locationBarView;
@property (weak, nonatomic) IBOutlet UIView *pickupBarView;
@property (weak, nonatomic) IBOutlet UILabel *pickupBarLabel;
@property (weak, nonatomic) IBOutlet UIView *dropoffBarView;
@property (weak, nonatomic) IBOutlet UILabel *dropoffBarLabel;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *locationBarSlideConstraint;


@property (nonatomic, assign) BOOL pickupBarSelected;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"pickupBarView frame: %@", NSStringFromCGRect(self.pickupBarView.frame) );
    NSLog(@"dropoffBarView frame: %@", NSStringFromCGRect(self.dropoffBarView.frame) );
    
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


- (void)tapRight:(UITapGestureRecognizer *)tapRecognizer
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
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             [self.locationBarView layoutIfNeeded];
                         }
                         completion:nil
         ];
        
        self.pickupBarSelected = NO;
    }
}

- (void)tapLeft:(UITapGestureRecognizer *)tapRecognizer
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

        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             [self.locationBarView layoutIfNeeded];
                         }
                         completion:nil
         ];
        
        self.pickupBarSelected = YES;
    }
}

@end
