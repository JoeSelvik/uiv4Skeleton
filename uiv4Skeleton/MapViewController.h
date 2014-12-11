//
//  MapViewController.h
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/30/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationSelectionViewController.h"

@interface MapViewController : UIViewController <LocationSelectionViewControllerDelegate>

- (TNTMapViewControllerState)mapVCState;

@end
