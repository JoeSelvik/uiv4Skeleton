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
    
    self.pickupBarLabel.contentMode = UIViewContentModeScaleAspectFill;
    self.dropoffBarLabel.contentMode = UIViewContentModeScaleAspectFill;
    
    self.pickupBarSelected = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tapRight:(UITapGestureRecognizer *)tapRecognizer
{
    if (self.pickupBarSelected) {
        
        [self.pickupBarLabel removeConstraint:self.locationBarSlideConstraint];
        
        self.locationBarSlideConstraint = [NSLayoutConstraint constraintWithItem:self.pickupBarLabel
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.locationBarView
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:0.8
                                                                        constant:0.0
                                           ];
        
        [self.pickupBarLabel addConstraint:self.locationBarSlideConstraint];
        
        
//        CGFloat screenWidth = self.locationBarView.frame.size.width;
//        CGFloat pickupBarViewWidth = screenWidth * 0.40;
//        CGFloat dropoffBarViewWidth = screenWidth * 0.60;
//        
//        CGRect newPickupBarLabelFrame = self.dropoffBarLabel.frame;
//        CGRect newDropoffBarLabelFrame = self.pickupBarLabel.frame;
//        NSLog(@"pre - pickupBarLabel frame: %@", NSStringFromCGRect(self.pickupBarLabel.frame));
//        NSLog(@"pre - dropoffBarLabel frame: %@", NSStringFromCGRect(self.dropoffBarLabel.frame));
//        NSLog(@"pre - pickupBarView frame: %@", NSStringFromCGRect(self.pickupBarView.frame));
//        NSLog(@"pre - dropoffBarView frame: %@", NSStringFromCGRect(self.dropoffBarView.frame));
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             [self.pickupBarLabel layoutIfNeeded];
//                             self.pickupBarLabel.frame = newPickupBarLabelFrame;
//                             self.dropoffBarLabel.frame = newDropoffBarLabelFrame;
//                             
//                             self.pickupBarView.frame = CGRectMake(0, 0, pickupBarViewWidth, 80);
//                             self.dropoffBarView.frame = CGRectMake(pickupBarViewWidth, 0, dropoffBarViewWidth, 80);
//                             
//                             [self.locationBarView layoutSubviews];
                         }
                         completion:^(BOOL finished){
//                             NSLog(@"post - pickupBarLabel frame: %@", NSStringFromCGRect(self.pickupBarLabel.frame));
//                             NSLog(@"post - dropoffBarLabel frame: %@", NSStringFromCGRect(self.dropoffBarLabel.frame));
//                             NSLog(@"post - pickupBarView frame: %@", NSStringFromCGRect(self.pickupBarView.frame));
//                             NSLog(@"post - dropoffBarView frame: %@", NSStringFromCGRect(self.dropoffBarView.frame));
                         }
         ];
        
        self.pickupBarSelected = NO;
    }
    
}

- (void)tapLeft:(UITapGestureRecognizer *)tapRecognizer
{
    if (!self.pickupBarSelected) {
        
        
        
//        CGFloat screenWidth = self.locationBarView.frame.size.width;
//        CGFloat pickupBarViewWidth = screenWidth * 0.60;
//        CGFloat dropoffBarViewWidth = screenWidth * 0.40;
//        
//        CGRect newPickupBarLabelFrame = self.dropoffBarLabel.frame;
//        CGRect newDropoffBarLabelFrame = self.pickupBarLabel.frame;
//        NSLog(@"pre - pickupBarLabel frame: %@", NSStringFromCGRect(self.pickupBarLabel.frame));
//        NSLog(@"pre - dropoffBarLabel frame: %@", NSStringFromCGRect(self.dropoffBarLabel.frame));
//        NSLog(@"pre - pickupBarView frame: %@", NSStringFromCGRect(self.pickupBarView.frame));
//        NSLog(@"pre - dropoffBarView frame: %@", NSStringFromCGRect(self.dropoffBarView.frame));
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             
//                             self.pickupBarLabel.frame = newPickupBarLabelFrame;
//                             self.dropoffBarLabel.frame = newDropoffBarLabelFrame;
//                             
//                             self.pickupBarView.frame = CGRectMake(0, 0, pickupBarViewWidth, 80);
//                             self.dropoffBarView.frame = CGRectMake(pickupBarViewWidth, 0, dropoffBarViewWidth, 80);
//                             
//                             [self.locationBarView layoutSubviews];
                         }
                         completion:^(BOOL finished){
//                             NSLog(@"post - pickupBarLabel frame: %@", NSStringFromCGRect(self.pickupBarLabel.frame));
//                             NSLog(@"post - dropoffBarLabel frame: %@", NSStringFromCGRect(self.dropoffBarLabel.frame));
//                             NSLog(@"post - pickupBarView frame: %@", NSStringFromCGRect(self.pickupBarView.frame));
//                             NSLog(@"post - dropoffBarView frame: %@", NSStringFromCGRect(self.dropoffBarView.frame));
                         }
         ];
        
        self.pickupBarSelected = YES;
    }
    
}

@end
