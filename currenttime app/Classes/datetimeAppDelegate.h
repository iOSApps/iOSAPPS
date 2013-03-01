//
//  datetimeAppDelegate.h
//  datetime
//
//  Created by sandeep on 13/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class datetimeViewController;

@interface datetimeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    datetimeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet datetimeViewController *viewController;

@end

