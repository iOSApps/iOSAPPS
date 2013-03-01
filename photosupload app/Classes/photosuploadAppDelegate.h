//
//  photosuploadAppDelegate.h
//  photosupload
//
//  Created by sandeep on 04/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class photosuploadViewController;

@interface photosuploadAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    photosuploadViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet photosuploadViewController *viewController;

@end

