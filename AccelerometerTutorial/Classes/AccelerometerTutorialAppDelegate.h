//
//  AccelerometerTutorialAppDelegate.h
//  AccelerometerTutorial
//
//  Created by Brandon Cannaday on 8/5/09.
//  Copyright Paranoid Ferret Productions 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AccelerometerTutorialAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window;
  MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

