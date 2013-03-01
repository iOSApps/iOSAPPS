//
//  scroolviewAppDelegate.h
//  scroolview
//
//  Created by sandeep on 31/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class scroolviewViewController;

@interface scroolviewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    scroolviewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet scroolviewViewController *viewController;

@end

