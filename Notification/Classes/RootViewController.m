//
//  RootViewController.m
//  Notification
//
//  Created by Objective Coders LLC. on 12/28/10.
//

#import "RootViewController.h"
#import "SetNotificationViewController.h"


@implementation RootViewController

@synthesize notificationsArray;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = @"Notifications";
	
	UIBarButtonItem *addNotificationButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNotification)];
	self.navigationItem.rightBarButtonItem = addNotificationButton;
	[addNotificationButton release];
	
	self.notificationsArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
}

#pragma mark -
#pragma mark Class Methods

- (void)addNotification {
	SetNotificationViewController *setNotificationViewController = [[SetNotificationViewController alloc] initWithNibName:@"SetNotificationViewController" bundle:nil];
	[setNotificationViewController setDelegate:self];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setNotificationViewController];
	[setNotificationViewController release];
	[self presentModalViewController:navController animated:YES];
	[navController release];
}

#pragma mark -
#pragma mark SetNotificationViewController Delegate Methods

//dismisses the modal view controller
- (void)dismissSetNotificationViewController {
	//reload the notifications array and table view
	self.notificationsArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
	[self.tableView reloadData];
	
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notificationsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	UILocalNotification *notifcation = [self.notificationsArray objectAtIndex:indexPath.row];
	
	[[cell textLabel] setText:[notifcation alertBody]];
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"MM/dd/yyyy hh:mma"];
	[[cell detailTextLabel] setText:[dateFormatter stringFromDate:notifcation.fireDate]];
	[dateFormatter release];

    return cell;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[notificationsArray release];
    [super dealloc];
}


@end

