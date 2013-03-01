//
//  IndianPinCodeSearchAppDelegate.h
//  IndianPinCodeSearch
//
//  Created by Manjunath Reddy on 13/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IndianPinCodeSearchViewController;

@interface IndianPinCodeSearchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IndianPinCodeSearchViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet IndianPinCodeSearchViewController *viewController;

@end

