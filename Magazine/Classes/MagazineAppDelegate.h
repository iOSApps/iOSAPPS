//
//  MagazineAppDelegate.h
//  Magazine
//
//  Created by siva kumar on 12/10/33.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MagazineViewController;

@interface MagazineAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MagazineViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MagazineViewController *viewController;

@end

