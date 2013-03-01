//
//  NSOperationTableAppDelegate.h
//  NSOperationTable
//
//  Created by Brandon Trebitowski on 3/4/10.
//  Copyright RightSprite 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSOperationTableAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

