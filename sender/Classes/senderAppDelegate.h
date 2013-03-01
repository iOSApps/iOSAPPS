//
//  senderAppDelegate.h
//  sender
//
//  Created by Manjunath Reddy on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class senderViewController;

@interface senderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    senderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet senderViewController *viewController;

@end

