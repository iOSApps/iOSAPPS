//
//  usingPlistAppDelegate.h
//  usingPlist
//
//  Created by Chakra on 13/02/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class usingPlistViewController;

@interface usingPlistAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    usingPlistViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet usingPlistViewController *viewController;

@end

