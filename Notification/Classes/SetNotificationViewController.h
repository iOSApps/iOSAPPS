//
//  SetNotificationViewController.h
//  Notifier
//
//  Created by Objective Coders LLC. on 12/28/10.
//

#import <UIKit/UIKit.h>

@protocol SetNotificationDelegate;

@interface SetNotificationViewController : UIViewController {
	id<SetNotificationDelegate> delegate;
	
	UIDatePicker *datePicker;
	
	NSDate *initialValue;
	
	UITextField *messageField;
}

@property (nonatomic, assign) id<SetNotificationDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) NSDate *initialValue;
@property (nonatomic, retain) IBOutlet UITextField *messageField;

- (void)cancelAddNotification;
- (void)addNotification;
- (IBAction)dismissKeyboard;

@end

@protocol SetNotificationDelegate <NSObject>

- (void)dismissSetNotificationViewController;

@end
