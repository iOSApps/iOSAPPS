//
//  nsdateAppDelegate.h
//  nsdate
//
//  Created by sandeep on 13/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class nsdateViewController;

@interface nsdateAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    nsdateViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet nsdateViewController *viewController;

@end

