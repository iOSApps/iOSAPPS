//
//  newAppDelegate.h
//  new
//
//  Created by sandeep on 29/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class newViewController;

@interface newAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    newViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet newViewController *viewController;

@end

