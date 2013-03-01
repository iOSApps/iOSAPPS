//
//  CheckMarkAppDelegate.m
//  CheckMark
//
//  Created by Chakra on 03/03/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CheckMarkAppDelegate.h"

@implementation CheckMarkAppDelegate

@synthesize window,myNavController ;

- (void)dealloc {
    [window release];
	[myNavController release];
    [super dealloc];
}



- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[window addSubview: myNavController.view];
	[window makeKeyAndVisible];
}


@end
