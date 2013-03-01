//
//  usingPlistAppDelegate.m
//  usingPlist
//
//  Created by Chakra on 13/02/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import "usingPlistAppDelegate.h"
#import "usingPlistViewController.h"

@implementation usingPlistAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}
/*- (void)applicationWillTerminate:(UIApplication *)application {
	
	UIApplication *app = [UIApplication sharedApplication];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"pushNotify" object:app];
}*/



- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
