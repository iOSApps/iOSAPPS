//
//  myMapAppDelegate.h
//  myMap
//
//  Created by Neelam Roy on 8/6/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myMapViewController;

@interface myMapAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    myMapViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet myMapViewController *viewController;

@end

