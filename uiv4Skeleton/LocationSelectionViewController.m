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
    // Do any additional setup after loading the view.
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


- (IBAction)tappedLocationButton:(id)sender
{
    
}
@end
