//
//  saveAppDelegate.h
//  save
//
//  Created by sandeep on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class saveViewController;

@interface saveAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    saveViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet saveViewController *viewController;

@end

