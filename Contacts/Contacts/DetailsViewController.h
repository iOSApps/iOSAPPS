//
//  DetailsViewController.h
//  Contacts
//
//  Created by Luc Wollants on 12/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;

@interface DetailsViewController : UIViewController {
    
    UITextField *firstNameTextField;
    UITextField *lastNameTextField;
    UIDatePicker *birthDatePicker;
    
    Contact *selectedContact;
}
@property (nonatomic, retain) IBOutlet UITextField *firstNameTextField;
@property (nonatomic, retain) IBOutlet UITextField *lastNameTextField;
@property (nonatomic, retain) IBOutlet UIDatePicker *birthDatePicker;
- (IBAction)onDeleteContact:(id)sender;

@property (nonatomic, retain) Contact *selectedContact;

@end
