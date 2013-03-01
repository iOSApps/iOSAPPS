//
//  LocalNotificationViewController.m
//  LocalNotification
//
//  Created by Cory Wiles on 4/8/10.
//  Copyright Wiles, LLC 2010. All rights reserved.
//

#import "LocalNotificationViewController.h"

@implementation LocalNotificationViewController

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void)viewDidLoad {
  
  UIApplication *app                = [UIApplication sharedApplication];
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  NSArray *oldNotifications         = [app scheduledLocalNotifications];
  
  if ([oldNotifications count] > 0) {
    [app cancelAllLocalNotifications];
  }
  
  if (notification == nil)
    return;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     //NSDate *fireDate = [df dateFromString:@"2011-06-15 06:00:00"];
                         
                         //NSDate *alertTime = [fireDate dateByAddingTimeInterval:10];
  NSDate *notificationDate = [NSDate dateWithTimeIntervalSinceNow:10];
  
  notification.fireDate  = notificationDate;
  notification.timeZone  = [NSTimeZone defaultTimeZone];
  notification.alertBody = @"Test Body";
    notification.soundName=UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber=3;
  
  [app scheduleLocalNotification:notification];

  [notification release];
  
  [super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
