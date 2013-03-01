//
//  BallAppDelegate.h
//  Ball
//
//  Created by Brandon Trebitowski on 10/27/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BallViewController;

@interface BallAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BallViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BallViewController *viewController;

@end

