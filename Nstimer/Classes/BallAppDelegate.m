//
//  BallAppDelegate.m
//  Ball
//
//  Created by Brandon Trebitowski on 10/27/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "BallAppDelegate.h"
#import "BallViewController.h"

@implementation BallAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
