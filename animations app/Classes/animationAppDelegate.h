//
//  animationAppDelegate.h
//  animation
//
//  Created by sandeep on 04/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class animationViewController;

@interface animationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    animationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet animationViewController *viewController;

@end

