//
//  AccelerometerTutorialAppDelegate.m
//  AccelerometerTutorial
//
//  Created by Brandon Cannaday on 8/5/09.
//  Copyright Paranoid Ferret Productions 2009. All rights reserved.
//

#import "AccelerometerTutorialAppDelegate.h"
#import "MainViewController.h"

@implementation AccelerometerTutorialAppDelegate

@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
  MainViewController *viewController = [[MainViewController alloc] 
                                        initWithNibName:@"MainViewController" 
                                        bundle:[NSBundle mainBundle]];
  
  self.mainViewController = viewController;
  [viewController release];
  
  [window addSubview:[viewController view]];
  
  [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
