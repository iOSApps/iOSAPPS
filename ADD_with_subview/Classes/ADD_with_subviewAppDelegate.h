//
//  ADD_with_subviewAppDelegate.h
//  ADD_with_subview
//
//  Created by saurabhkumar on 27/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADD_with_subviewViewController;

@interface ADD_with_subviewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ADD_with_subviewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ADD_with_subviewViewController *viewController;

@end

