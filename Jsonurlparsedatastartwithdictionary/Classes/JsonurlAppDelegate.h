//
//  JsonurlAppDelegate.h
//  Jsonurl
//
//  Created by aslam on 28/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JsonurlViewController;

@interface JsonurlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JsonurlViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JsonurlViewController *viewController;

@end

