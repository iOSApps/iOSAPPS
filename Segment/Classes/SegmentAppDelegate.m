//
//  SegmentAppDelegate.m
//  Segment
//
//  Created by Deepak Kumar on 22/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "SegmentAppDelegate.h"
#import "SegmentViewController.h"

@implementation SegmentAppDelegate

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
