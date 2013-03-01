//
//  addressBookAppDelegate.h
//  addressBook
//
//  Created by Mike Zupan on 9/19/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class addressBookViewController;

@interface addressBookAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet addressBookViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) addressBookViewController *viewController;

@end

