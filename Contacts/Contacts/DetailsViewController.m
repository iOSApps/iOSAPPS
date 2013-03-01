//
//  DetailsViewController.m
//  Contacts
//
//  Created by Luc Wollants on 12/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import "DetailsViewController.h"
#import "Contact.h"
#import "DataController.h"

@implementation DetailsViewController

@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize birthDatePicker;
@synthesize selectedContact;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDone:)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancel:)];
    }
    return self;
}

- (void)dealloc
{
    [firstNameTextField release];
    [lastNameTextField release];
    [birthDatePicker release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated
{
    self.firstNameTextField.text = selectedContact.firstName;
    self.lastNameTextField.text = selectedContact.lastName;
    self.birthDatePicker.date = selectedContact.birthDate;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setFirstNameTextField:nil];
    [self setLastNameTextField:nil];
    [self setBirthDatePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)onDone:sender
{
    selectedContact.firstName = self.firstNameTextField.text;
    selectedContact.lastName = self.lastNameTextField.text;
    selectedContact.birthDate = self.birthDatePicker.date;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onCancel:sender
{
    [self.navigationController popViewControllerAnimated:YES];    
}

- (IBAction)onDeleteContact:(id)sender {
    [[DataController instance]deleteContact:selectedContact];
    [self.navigationController popViewControllerAnimated:YES];    
}
@end
