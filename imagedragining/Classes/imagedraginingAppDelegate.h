//
//  imagedraginingAppDelegate.h
//  imagedragining
//
//  Created by sandeep on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class imagedraginingViewController;

@interface imagedraginingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    imagedraginingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet imagedraginingViewController *viewController;

@end

