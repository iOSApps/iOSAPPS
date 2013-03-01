//
//  mapsAppDelegate.h
//  maps
//
//  Created by vanita on 23/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class mapsViewController;

@interface mapsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    mapsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet mapsViewController *viewController;

@end

