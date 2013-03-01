//
//  IndainRailWayPNRStatusAppDelegate.h
//  IndainRailWayPNRStatus
//
//  Created by venkat on 10/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IndainRailWayPNRStatusViewController;

@interface IndainRailWayPNRStatusAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IndainRailWayPNRStatusViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet IndainRailWayPNRStatusViewController *viewController;

@end

