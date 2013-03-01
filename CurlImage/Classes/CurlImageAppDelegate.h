//
//  CurlImageAppDelegate.h
//  CurlImage
//
//  Created by Deepak Kumar on 22/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CurlImageViewController;

@interface CurlImageAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CurlImageViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CurlImageViewController *viewController;

@end

