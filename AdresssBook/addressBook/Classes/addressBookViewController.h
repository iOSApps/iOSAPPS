//
//  addressBookViewController.h
//  addressBook
//
//  Created by Mike Zupan on 9/19/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface addressBookViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate> {
	IBOutlet UIButton *button;
	IBOutlet UILabel *firstName;
	IBOutlet UILabel *lastName;
	IBOutlet UILabel *number;
}

-(IBAction)getContact;

@end

