//
//  Async_LoadingAppDelegate.m
//  Async Loading
//
//  Created by Charlie Key on 5/13/10.
//  Copyright Paranoid Ferret Productions 2010. All rights reserved.
//

#import "Async_LoadingAppDelegate.h"
#import "Async_LoadingViewController.h"

@implementation Async_LoadingAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
