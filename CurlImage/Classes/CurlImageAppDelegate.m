//
//  CurlImageAppDelegate.m
//  CurlImage
//
//  Created by Deepak Kumar on 22/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "CurlImageAppDelegate.h"
#import "CurlImageViewController.h"

@implementation CurlImageAppDelegate

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
