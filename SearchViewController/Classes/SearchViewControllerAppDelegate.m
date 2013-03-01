//
//  SearchViewControllerAppDelegate.m
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "SearchViewControllerAppDelegate.h"
#import "RootViewController.h"


@implementation SearchViewControllerAppDelegate

@synthesize window;
@synthesize navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

