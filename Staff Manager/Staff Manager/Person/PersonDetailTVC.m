//
//  PersonDetailTVC.m
//  Staff Manager
//
//  Created by Tim Roadley on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailTVC.h"

@implementation PersonDetailTVC
@synthesize btnsave = _btnsave;
@synthesize delegate;
//@synthesize personNameTextField;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize person = _person;
@synthesize selectedRole;
@synthesize personFirstnameTextField = _personFirstnameTextField;
@synthesize personSurnameTextField = _personSurnameTextField;
@synthesize txtemail = _txtemail;
@synthesize txtcontact = _txtcontact;
@synthesize txtdob = _txtdob;
@synthesize txtcourse = _txtcourse;
@synthesize txtnotes = _txtnotes;
@synthesize personRoleTableViewCell = _personRoleTableViewCell;

- (void)viewDidLoad 
{
    NSLog(@"Setting the value of fields in this static table to that of the passed Person");
    //self.personNameTextField.text = self.person.name;
    self.personFirstnameTextField.text = self.person.firstname;
    self.personSurnameTextField.text = self.person.surname;
    self.txtcontact.text = self.person.contact;
    self.txtcourse.text = self.person.course;
    self.txtdob.text = self.person.dob;
    self.txtemail.text = self.person.email;
    self.txtnotes.text = self.person.notes;
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"bg.png"]];
    self.tableView.opaque = NO;    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:38/256.0 green:117/256.0 blue:97/256.0 alpha:1.0]];}

- (void)viewDidUnload
{
    //[self setPersonNameTextField:nil];
    [self setPersonFirstnameTextField:nil];
    [self setPersonSurnameTextField:nil];
    [self setPersonRoleTableViewCell:nil];
    [self setTxtemail:nil];
    [self setTxtcontact:nil];
    [self setTxtdob:nil];
    [self setTxtcourse:nil];
    [self setTxtnotes:nil];
    [self setBtnsave:nil];
    btnsave = nil;
    [super viewDidUnload];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.person)        
    {    
        
        self.title = @"Student Detail";        
       _personFirstnameTextField.text = [self.person firstname];
        _personSurnameTextField.text = [self.person surname];        
        _txtemail.text = [self.person email]; 
        _txtdob.text= [self.person dob];
        _txtcourse.text = [self.person course];
        _txtnotes.text = [self.person notes];
        _txtcontact.text = [self.person contact];
        //txtphonenum.tag =*([self.studentInfo student_phone]); 
        //[managedObjectContext setValue:txtphonenum.text forKey:@"student_phone"];
        
        
        
        [_personFirstnameTextField setEnabled:NO];
        [ _personSurnameTextField setEnabled:NO];        
        [_txtemail setEnabled:NO]; 
        [_txtcourse setEnabled:NO];
        [_txtnotes setEnabled:NO];
        [_txtdob setEnabled:NO];
        [_txtcontact setEnabled:NO];
        
        [btnsave setTitle:@"Edit"];
        
    }
}


- (IBAction)save:(id)sender
{
    /*NSLog(@"Telling the PersonDetailTVC Delegate that Save was tapped on the PersonDetailTVC");
    self.person.dob = self.txtdob.text;
    self.person.email = self.txtemail.text;
    self.person.course = self.txtcourse.text;
    self.person.contact = self.txtcontact.text;
    self.person.notes = self.txtnotes.text;
    self.person.firstname = self.personFirstnameTextField.text; // Set Firstname
    self.person.surname = self.personSurnameTextField.text; // Set Surname
    [self.person setInRole:self.selectedRole]; // Set Relationship!!!
    [self.managedObjectContext save:nil];  // write to database
    [self.delegate theSaveButtonOnThePersonDetailTVCWasTapped:self];*/
 
    //*****  new ****//
    
    if(btnsave.title==@"Update")
    {
        self.person.firstname = _personFirstnameTextField.text;
        self.person.surname = _personSurnameTextField.text;
        self.person.email = _txtemail.text;
        self.person.notes = _txtnotes.text;
        self.person.course = _txtcourse.text;
        self.person.contact =  _txtcontact.text;        
        self.person.dob = _txtdob.text;
        NSError *error;
        if (![self.managedObjectContext save:&error])
        {
            NSLog(@"oops, couldn't save: %@", [error localizedDescription]); 
        }    
        
        [self.delegate theSaveButtonOnThePersonDetailTVCWasTapped:self];
    }
    else if(btnsave.title==@"Edit") 
    {
        
        //btnsave.enabled=NO;
        // create a toolbar to have two buttons in the right
        [_personFirstnameTextField setEnabled:YES];
        [_personSurnameTextField setEnabled:YES];        
        [_txtemail setEnabled:YES];  
        [_txtcourse setEnabled:YES];
        [_txtdob setEnabled:YES];
        [_txtnotes setEnabled:YES]; 
        [_txtcontact setEnabled:YES];
        
        [btnsave setTitle:@"Update"];
    }
    else
    {
        Person *info = [NSEntityDescription
                         insertNewObjectForEntityForName: @"Person" 
                         inManagedObjectContext: self.managedObjectContext];
        
        info.firstname= _personFirstnameTextField .text;
        info.surname= _personSurnameTextField .text;
        info.email = _txtemail.text;
        info.course = _txtcourse.text;
        info.notes = _txtnotes.text;
        info.contact= _txtcontact.text;
        // [managedObjectContext setValue:txtphonenum.text forKey:@"student_phone"];
        
        
        info.dob = _txtdob.text;
        //info.student_phone = txtphonenum.text;
        //self.studentInfo.student_phone = [NSDecimalNumber decimalNumberWithString:txtphonenum.text];
        NSError *error;
        if (![self.managedObjectContext save:&error])
        {
            NSLog(@"oops, couldn't save: %@", [error localizedDescription]); 
        }    
        
        [self.delegate theSaveButtonOnThePersonDetailTVCWasTapped:self];
    }    
    
    
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender  // !
{
    if ([segue.identifier isEqualToString:@"Person Role Segue"])
	{
        NSLog(@"Setting PersonDetailTVC as a delegate of PersonRoleTVC");
        PersonRoleTVC *personRoleTVC = segue.destinationViewController;
        personRoleTVC.delegate = self;
        personRoleTVC.managedObjectContext = self.managedObjectContext;
	}
    else {
        NSLog(@"Unidentified Segue Attempted!");
    }
}

- (void)roleWasSelectedOnPersonRoleTVC:(PersonRoleTVC *)controller 
{
    self.personRoleTableViewCell.textLabel.text = controller.selectedRole.name;
    self.selectedRole = controller.selectedRole;
    NSLog(@"PersonDetailTVC reports that the %@ role was selected on the PersonRoleTVC", controller.selectedRole.name);
    [controller.navigationController popViewControllerAnimated:YES];
}@end


