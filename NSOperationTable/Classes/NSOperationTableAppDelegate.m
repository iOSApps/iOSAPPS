//
//  NSOperationTableAppDelegate.m
//  NSOperationTable
//
//  Created by Brandon Trebitowski on 3/4/10.
//  Copyright RightSprite 2010. All rights reserved.
//

#import "NSOperationTableAppDelegate.h"
#import "RootViewController.h"


@implementation NSOperationTableAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

