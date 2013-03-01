//
//  PreloaderAppDelegate.h
//  Preloader
//
//  Created by NMG on 8/22/11.
//  Copyright 2011 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PreloaderViewController.h"

@interface PreloaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	PreloaderViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) PreloaderViewController *viewController;

@end

