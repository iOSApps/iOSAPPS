//
//  Button_ExampleAppDelegate.h
//  Button_Example
//
//  Created by Chakra on 07/04/11.
//  Copyright 2011 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Button_ExampleViewController;

@interface Button_ExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Button_ExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Button_ExampleViewController *viewController;

@end

