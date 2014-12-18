//
//  MapViewController.h
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/30/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationSelectionViewController.h"

typedef NS_ENUM(NSInteger, TNTMapViewControllerState) {
    TNTMapViewControllerStateUnmovedPickup,
    TNTMapViewControllerStateMovedPickup,
    TNTMapViewControllerStateUnmovedDropoff,
    TNTMapViewControllerStateMovedDropoff,
    TNTMapViewControllerStateContactingDispatch
};

@interface MapViewController : UIViewController <LocationSelectionViewControllerDelegate>

- (TNTMapViewControllerState)mapVCState;

@end
