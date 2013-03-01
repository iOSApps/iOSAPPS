//
//  SimpleTableAppDelegate.m
//  SimpleTable
//
//  Created by Adeem on 17/05/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SimpleTableAppDelegate.h"
#import "SimpleTableViewController.h"

@implementation SimpleTableAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application { 
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    // Override point for customization after app launch    
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
