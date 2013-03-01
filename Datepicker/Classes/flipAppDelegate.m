//
//  flipAppDelegate.m
//  flip
//
//  Created by flab on 10/18/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "flipAppDelegate.h"
#import "flipViewController.h"

@implementation flipAppDelegate

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
