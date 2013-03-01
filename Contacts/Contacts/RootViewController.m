//
//  RootViewController.m
//  Contacts
//
//  Created by Luc Wollants on 06/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import "RootViewController.h"
#import "DataController.h"
#import "Contact.h"
#import "DetailsViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    const NSInteger searchBarHeight = 45;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, searchBarHeight)];
    searchBar.delegate = self;
    self.tableView.tableHeaderView = searchBar;
    [searchBar release];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddContact:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[DataController instance]filterContactsWithLastName:searchString]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }

    Contact *contact = [[[DataController instance]filterContactsWithLastName:searchString]objectAtIndex:indexPath.row];
    cell.textLabel.text = contact.lastName;
    cell.detailTextLabel.text = contact.firstName;
    
    // Configure the cell.
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    DetailsViewController *detailsViewController = [[DetailsViewController alloc]initWithNibName:@"DetailsViewController" bundle:[NSBundle mainBundle]];
    
    Contact *selectedContact = [[[DataController instance]contacts]objectAtIndex:indexPath.row];    
    detailsViewController.selectedContact = selectedContact;
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    
    [detailsViewController release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Searching

- (void)updateSearchString:(NSString*)aSearchString
{
    [searchString release];
    searchString = [[NSString alloc]initWithString:aSearchString];
    [self.tableView reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    self.tableView.allowsSelection = NO;
    self.tableView.scrollEnabled = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{   
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
    searchBar.text=@"";
    [self updateSearchString:searchBar.text];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
    [self updateSearchString:searchBar.text];    
}

#pragma mark - Adding

- (void)onAddContact:sender
{
    Contact *newContact = [[Contact alloc]initWithFirstName:@"First Name" andLastName:@"Last Name" andBirthDate:[NSDate date]];
    [[DataController instance]addContact:newContact];
 
    DetailsViewController *detailsViewController = [[DetailsViewController alloc]initWithNibName:@"DetailsViewController" bundle:[NSBundle mainBundle]];
    detailsViewController.selectedContact = newContact;
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    
    [detailsViewController release];
}

@end
