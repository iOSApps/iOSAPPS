//
//  NotificationAppDelegate.h
//  Notification
//
//  Created by Objective Coders LLC. on 12/28/10.
//

#import <UIKit/UIKit.h>

@interface NotificationAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

