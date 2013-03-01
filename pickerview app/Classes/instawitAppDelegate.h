//
//  instawitAppDelegate.h
//  instawit
//
//  Created by Anurag Gupta on 24/12/10.
//  Copyright 2010 iphonetut. All rights reserved.
//

#import <UIKit/UIKit.h>

@class instawitViewController;

@interface instawitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    instawitViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet instawitViewController *viewController;

@end

