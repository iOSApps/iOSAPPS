//
//  IndexedTableAppDelegate.m
//  IndexedTable
//
//  Created by cwiles on 2/24/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//  web: http://www.corywiles.com/
//  email: kwylez@gmail.com
//

#import "IndexedTableAppDelegate.h"

@implementation IndexedTableAppDelegate

@synthesize window;
@synthesize controller;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

  controller = [[StatesViewController alloc] initWithStyle:UITableViewStylePlain];
  
  [window addSubview:controller.view];
  [window makeKeyAndVisible];
}


- (void)dealloc {
  [window release];
  [controller release];
  [super dealloc];
}


@end
