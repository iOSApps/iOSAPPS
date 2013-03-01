//
//  flipAppDelegate.h
//  flip
//
//  Created by flab on 10/18/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class flipViewController;

@interface flipAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    flipViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet flipViewController *viewController;

@end

