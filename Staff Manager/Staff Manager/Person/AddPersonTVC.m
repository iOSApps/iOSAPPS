//
//  AddPersonTVC.m
//  Staff Manager
//
//  Created by Tim Roadley on 9/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddPersonTVC.h"

@implementation AddPersonTVC
@synthesize delegate;
//@synthesize personNameTextField;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize personFirstnameTextField;
@synthesize personSurnameTextField;
@synthesize txtcontact;
@synthesize txtemail;
@synthesize txtcourse;
@synthesize txtdob;
@synthesize txtnotes;
//@synthesize dob;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"bg.png"]];
    self.tableView.opaque = NO;    
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:38/256.0 green:117/256.0 blue:97/256.0 alpha:1.0]];    
   }




- (void)viewDidUnload
{
    //[self setPersonNameTextField:nil];
    [self setPersonFirstnameTextField:nil];
    [self setPersonSurnameTextField:nil];
    [self setTxtemail:nil];
    [self setTxtcontact:nil];
   // [self setDob:nil];
    [self setTxtdob:nil];
    [self setTxtcourse:nil];
    [self setTxtnotes:nil];
    [super viewDidUnload];
}




- (IBAction)save:(id)sender
{
    NSLog(@"Telling the AddPersonTVC Delegate that Save was tapped on the AddPersonTVC");
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person"
                                               inManagedObjectContext:self.managedObjectContext];
    
    //person.name = personNameTextField.text;
    person.firstname = personFirstnameTextField.text;
    person.surname = personSurnameTextField.text;
    person.contact = txtcontact.text;
    person.course = txtcourse.text;
    person.dob = txtdob.text;
    person.email = txtemail.text;
    person.notes = txtnotes.text;
    
    [self.managedObjectContext save:nil];  // write to database
    
    [self.delegate theSaveButtonOnTheAddPersonTVCWasTapped:self];
    
     
    
    
    
    
    
    
    
}
@end


