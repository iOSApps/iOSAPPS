//
//  addressBookAppDelegate.m
//  addressBook
//
//  Created by Mike Zupan on 9/19/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "addressBookAppDelegate.h"
#import "addressBookViewController.h"

@implementation addressBookAppDelegate

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
