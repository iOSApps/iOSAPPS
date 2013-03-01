//
//  savedetaildatabaseAppDelegate.h
//  savedetaildatabase
//
//  Created by rajan on 9/14/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class savedetaildatabaseViewController;

@interface savedetaildatabaseAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    savedetaildatabaseViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet savedetaildatabaseViewController *viewController;

@end

