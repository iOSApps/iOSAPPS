//
//  addressBookAppDelegate.m
//  addressBook
//
//  Created by Mike Zupan on 9/19/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "addressBookViewController.h"

@implementation addressBookViewController

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

/*
 Implement viewDidLoad if you need to do additional setup after loading the view.
- (void)viewDidLoad {
	[super viewDidLoad];
}
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

-(IBAction)getContact {
	// creating the picker
	ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
	// place the delegate of the picker to the controll
	picker.peoplePickerDelegate = self;
	
	// showing the picker
	[self presentModalViewController:picker animated:YES];
	// releasing
	[picker release];
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    // assigning control back to the main controller
	[self dismissModalViewControllerAnimated:YES];
}

- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
	// setting the first name
    firstName.text = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
	
	// setting the last name
    lastName.text = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);	
	
	// setting the number
	/*
	 this function will set the first number it finds
	 
	 if you do not set a number for a contact it will probably
	 crash
	 */
	ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
	number.text = (NSString*)ABMultiValueCopyValueAtIndex(multi, 0);
	
	// remove the controller
    [self dismissModalViewControllerAnimated:YES];

    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

- (void)dealloc {
	[super dealloc];
}

@end
