//
//  projectAppDelegate.h
//  project
//
//  Created by arunbabu on 19/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class projectViewController;

@interface projectAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    projectViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet projectViewController *viewController;

@end

