//
//  plistAppDelegate.h
//  plist
//
//  Created by naveen on 29/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class plistViewController;

@interface plistAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    plistViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet plistViewController *viewController;

@end

