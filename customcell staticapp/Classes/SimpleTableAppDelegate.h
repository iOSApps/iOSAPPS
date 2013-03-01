//
//  SimpleTableAppDelegate.h
//  SimpleTable
//
//  Created by Adeem on 17/05/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleTableViewController;

@interface SimpleTableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SimpleTableViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SimpleTableViewController *viewController;

@end

