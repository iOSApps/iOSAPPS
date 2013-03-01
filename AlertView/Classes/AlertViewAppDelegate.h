//
//  AlertViewAppDelegate.h
//  AlertView
//
//  Created by sandeep on 16/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlertViewViewController;

@interface AlertViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AlertViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AlertViewViewController *viewController;

@end

