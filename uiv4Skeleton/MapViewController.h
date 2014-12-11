//
//  MapViewController.h
//  uiv4Skeleton
//
//  Created by Joe Selvik on 11/30/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationSelectionViewController.h"

@protocol MapViewControllerStateDelegate;


@interface MapViewController : UIViewController <LocationSelectionViewControllerDelegate>

@property (nonatomic, weak) id<MapViewControllerStateDelegate>locationSelectionVCDelegate;

@end


@protocol MapViewControllerStateDelegate <NSObject>

typedef NS_ENUM(NSInteger, TNTMapViewControllerState) {
    TNTMapViewControllerStateDragForPickup,
    TNTMapViewControllerStateDraggedForPickup,
    TNTMapViewControllerStateDragForDropoff,
    TNTMapViewControllerStateDraggedForDropoff,
    TNTMapViewControllerStateContactingDispatch
};

- (TNTMapViewControllerState)mapVCState;

@end
