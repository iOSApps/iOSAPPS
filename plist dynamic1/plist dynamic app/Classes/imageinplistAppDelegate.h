//
//  imageinplistAppDelegate.h
//  imageinplist
//
//  Created by sandeep on 05/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class imageinplistViewController;

@interface imageinplistAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    imageinplistViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet imageinplistViewController *viewController;

@end

