//
//  PersonDetailTVC.h
//  Staff Manager
//
//  Created by Tim Roadley on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Role.h"
#import "PersonRoleTVC.h"

@class PersonDetailTVC;
@protocol PersonDetailTVCDelegate <NSObject>
- (void)theSaveButtonOnThePersonDetailTVCWasTapped:(PersonDetailTVC *)controller;
@end

@interface PersonDetailTVC : UITableViewController <PersonRoleTVCDelegate>
{
    
     IBOutlet UIBarButtonItem *btnsave;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnsave;

@property (nonatomic, weak) id <PersonDetailTVCDelegate> delegate;
//@property (strong, nonatomic) IBOutlet UITextField *personNameTextField;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) Role *selectedRole;
@property (strong, nonatomic) IBOutlet UITextField *personFirstnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *personSurnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;

@property (weak, nonatomic) IBOutlet UITextField *txtcontact;

@property (weak, nonatomic) IBOutlet UITextField *txtdob;

@property (weak, nonatomic) IBOutlet UITextField *txtcourse;

@property (weak, nonatomic) IBOutlet UITextField *txtnotes;


@property (strong, nonatomic) IBOutlet UITableViewCell *personRoleTableViewCell;

- (IBAction)save:(id)sender;

@end




