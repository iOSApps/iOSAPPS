//
//  two_plistsAppDelegate.h
//  two plists
//
//  Created by sandeep on 12/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class two_plistsViewController;

@interface two_plistsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    two_plistsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet two_plistsViewController *viewController;

@end

