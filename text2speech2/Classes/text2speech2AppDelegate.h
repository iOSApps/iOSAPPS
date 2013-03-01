//
//  text2speech2AppDelegate.h
//  text2speech2
//
//  Created by Snow Leopard User on 03/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class text2speech2ViewController;

@interface text2speech2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    text2speech2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet text2speech2ViewController *viewController;

@end

