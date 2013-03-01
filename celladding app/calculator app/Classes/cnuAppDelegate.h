//
//  cnuAppDelegate.h
//  cnu
//
//  Created by sandeep on 23/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class cnuViewController;

@interface cnuAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    cnuViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet cnuViewController *viewController;

@end

