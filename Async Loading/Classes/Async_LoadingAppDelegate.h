//
//  Async_LoadingAppDelegate.h
//  Async Loading
//
//  Created by Charlie Key on 5/13/10.
//  Copyright Paranoid Ferret Productions 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Async_LoadingViewController;

@interface Async_LoadingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Async_LoadingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Async_LoadingViewController *viewController;

@end

