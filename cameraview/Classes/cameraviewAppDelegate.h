//
//  cameraviewAppDelegate.h
//  cameraview
//
//  Created by sandeep on 31/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class cameraviewViewController;

@interface cameraviewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    cameraviewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet cameraviewViewController *viewController;

@end

