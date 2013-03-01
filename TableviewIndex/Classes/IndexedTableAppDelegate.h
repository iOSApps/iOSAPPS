//
//  IndexedTableAppDelegate.h
//  IndexedTable
//
//  Created by cwiles on 2/24/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//  web: http://www.corywiles.com/
//  email: kwylez@gmail.com
//

#import <UIKit/UIKit.h>
#import "StatesViewController.h"

@interface IndexedTableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    StatesViewController *controller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) StatesViewController *controller;
@end

