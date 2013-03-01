//
//  MapKitDisplayAppDelegate.h
//  MapKitDisplay
//
//  Created by Chakra on 12/07/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapKitDisplayViewController;

@interface MapKitDisplayAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapKitDisplayViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapKitDisplayViewController *viewController;

@end

