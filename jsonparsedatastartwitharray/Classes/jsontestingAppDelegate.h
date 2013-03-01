//
//  jsontestingAppDelegate.h
//  jsontesting
//
//  Created by srama on 28/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class jsontestingViewController;

@interface jsontestingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    jsontestingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet jsontestingViewController *viewController;

@end

