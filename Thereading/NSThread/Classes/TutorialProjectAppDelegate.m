//
//  TutorialProjectAppDelegate.m
//  TutorialProject
//
//  Created by Ondrej Rafaj on 5.8.09.
//  Copyright Home 2009. All rights reserved.
//

#import "TutorialProjectAppDelegate.h"
#import "TutorialProjectViewController.h"

@implementation TutorialProjectAppDelegate

@synthesize window;
@synthesize viewController;

// ------ Tutorial code starts here ------


// ------ Tutorial code ends here ------

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
