//
//  TableViewAppDelegate.m
//  TableView
//
//  Created by Jai Kirdatt on 1/17/09.
//  Copyright www.iPhoneSDKArticles.com 2009. 
//

#import "TableViewAppDelegate.h"
#import "RootViewController.h"


@implementation TableViewAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
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
