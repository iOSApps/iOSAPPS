//
//  AppDelegate.h
//  Facebook
//
//  Created by Guest on 08/02/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
