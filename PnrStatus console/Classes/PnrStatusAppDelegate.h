//
//  PnrStatusAppDelegate.h
//  PnrStatus
//
//  Created by venkat on 05/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PnrStatusViewController;

@interface PnrStatusAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PnrStatusViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PnrStatusViewController *viewController;

@end

