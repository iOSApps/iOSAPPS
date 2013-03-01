//
//  AddPersonTVC.h
//  Staff Manager
//
//  Created by Tim Roadley on 9/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@class AddPersonTVC;
@protocol AddPersonTVCDelegate <NSObject>
- (void)theSaveButtonOnTheAddPersonTVCWasTapped:(AddPersonTVC *)controller;
@end

@interface AddPersonTVC : UITableViewController
@property (nonatomic, weak) id <AddPersonTVCDelegate> delegate;
//@property (strong, nonatomic) IBOutlet UITextField *personNameTextField;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UITextField *personFirstnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *personSurnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *txtcontact;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtcourse;
@property (weak, nonatomic) IBOutlet UITextField *txtdob;
@property (weak, nonatomic) IBOutlet UITextField *txtnotes;


- (IBAction)save:(id)sender;

@end
