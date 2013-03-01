//
//  CheckMarkAppDelegate.h
//  CheckMark
//
//  Created by Chakra on 03/03/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckMarkAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *myNavController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *myNavController;

@end

