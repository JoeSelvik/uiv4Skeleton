//
//  baltoStateProtocol.h
//  uiv4Skeleton
//
//  Created by Joe Selvik on 12/11/14.
//  Copyright (c) 2014 The New Tricks. All rights reserved.
//

#ifndef uiv4Skeleton_baltoStateProtocol_h
#define uiv4Skeleton_baltoStateProtocol_h


#endif

#import <Foundation/Foundation.h>

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
