//
//  LocationSelectionViewController.h
//  uiv4Skeleton
//
//  Created by Joe Selvik on 12/1/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LocationSelectionViewControllerDelegate;


@interface LocationSelectionViewController : UIViewController

@property (nonatomic, weak) id<LocationSelectionViewControllerDelegate> delegate;

- (void)enableButton;
- (void)disableButton;
- (void)setButtonTitle:(NSString *)title;

@end


@protocol LocationSelectionViewControllerDelegate <NSObject>

- (void)locationSelectionVC:(LocationSelectionViewController *)viewController movedToNextState:(TNTMapViewControllerState)state;

@end
