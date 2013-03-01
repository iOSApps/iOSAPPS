//
//  RootViewController.h
//  Notification
//
//  Created by Objective Coders LLC. on 12/28/10.
//

#import <UIKit/UIKit.h>
#import "SetNotificationViewController.h"

@interface RootViewController : UITableViewController<SetNotificationDelegate> {
	NSArray *notificationsArray;
}

@property (nonatomic, retain) NSArray *notificationsArray;

@end
