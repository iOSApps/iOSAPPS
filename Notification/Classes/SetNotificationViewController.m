//
//  SetNotificationViewController.m
//  Notifier
//
//  Created by Objective Coders LLC. on 12/28/10.
//

#import "SetNotificationViewController.h"

@implementation SetNotificationViewController

@synthesize delegate;
@synthesize datePicker;
@synthesize initialValue;
@synthesize messageField;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = @"Add Notification";

	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAddNotification)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addNotification)];
	self.navigationItem.rightBarButtonItem = addButton;
	
	//set the date pickers date and the minimum date to now
	[self.datePicker setDate:[NSDate date]];
	[self.datePicker setMinimumDate:[NSDate date]];
}

- (void)cancelAddNotification {
	[self.delegate dismissSetNotificationViewController];
}

- (void)addNotification {
	
	UILocalNotification *localNotification = [[UILocalNotification alloc] init];
	
	localNotification.fireDate = self.datePicker.date;
	localNotification.alertBody = self.messageField.text;
	localNotification.soundName = UILocalNotificationDefaultSoundName;
	localNotification.applicationIconBadgeNumber = 1;
	
	NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
	
	[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
	[localNotification release];
	
	[self.delegate dismissSetNotificationViewController];
}

- (IBAction)dismissKeyboard {
	[self.messageField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
	self.datePicker = nil;
	self.messageField = nil;
}


- (void)dealloc {
	[messageField release];
	[datePicker release];
	[initialValue release];
    [super dealloc];
}


@end
