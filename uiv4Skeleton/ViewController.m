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
@property (weak, nonatomic) IBOutlet UIView *dropoffBarView;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tapRight:(UITapGestureRecognizer *)tapRecognizer
{
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.dropoffBarView.transform = CGAffineTransformMakeTranslation(-50.0, 0);
                     }
                     completion:nil
     ];
}

- (void)tapLeft:(UITapGestureRecognizer *)tapRecognizer
{
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.pickupBarView.transform = CGAffineTransformMakeTranslation(50.0, 0);
                     }
                     completion:nil
     ];
}

@end
