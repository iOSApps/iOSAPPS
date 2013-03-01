//
//  RootViewController.m
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "RootViewController.h"
#import "SearchViewControllerAppDelegate.h"
#import "DetailViewController.h"
#import "OverlayViewController.h"


@implementation RootViewController

-   (void)viewDidLoad 
{
    [super viewDidLoad];
	
	//Initialize the array.
	Items = [[NSMutableArray alloc] init];
	
	//Add items
	NSArray *countriesToLiveInArray = [NSArray arrayWithObjects:@"Pakistan", @"china", @"Srilanka", @"Swizerland", @"New Zealand", @"Green Land", @"Africa", @"Ireland",@"Canada",@"Japan",@"Afganistan", nil];
	NSDictionary *countriesToLiveInDict = [NSDictionary dictionaryWithObject:countriesToLiveInArray forKey:@"Countries"];
	
	NSArray *countriesLivedInArray = [NSArray arrayWithObjects:@"India", @"U.S.A",@"Nepal", nil];
	NSDictionary *countriesLivedInDict = [NSDictionary dictionaryWithObject:countriesLivedInArray forKey:@"Countries"];
	
	[Items addObject:countriesToLiveInDict];
	[Items addObject:countriesLivedInDict];	
	
	//Initialize the copy array.
	copyListOfItems = [[NSMutableArray alloc] init];
	
		// set the title
	self.navigationItem.title =@" Countries ";
	
	//Add the search bar
	self.tableView.tableHeaderView = searchBar;
	searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	
	searching = NO;
	letUserSelectRow = YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
	// Release any cached data, images, etc that aren't in use.
}
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	
	if (searching)
		return 1;
	else
		return [Items count];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	if (searching)
		return [copyListOfItems count];                           //copyItems
	else {
		
		//Number of rows it should expect should be based on the section
		NSDictionary *dictionary = [Items objectAtIndex:section];
		NSArray *array = [dictionary objectForKey:@"Countries"];
		return [array count];
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if(searching)
		return @"Search Results";
	
	if(section == 0)
		return @"Countries to visit";
	else
		return @"Countries visited";
}

// method to dislay index on Table view to show uncommand it

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
//{
//	
//	if(searching)
//		return nil;
//	
//	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//	[tempArray addObject:@"A"];
//	[tempArray addObject:@"B"];
//	[tempArray addObject:@"C"];
//	[tempArray addObject:@"D"];
//	[tempArray addObject:@"E"];
//	[tempArray addObject:@"F"];
//	[tempArray addObject:@"G"];
//	[tempArray addObject:@"H"];
//	[tempArray addObject:@"I"];
//	[tempArray addObject:@"J"];
//	[tempArray addObject:@"K"];
//	[tempArray addObject:@"L"];
//	[tempArray addObject:@"M"];
//	[tempArray addObject:@"N"];
//	[tempArray addObject:@"O"];
//	[tempArray addObject:@"P"];
//	[tempArray addObject:@"Q"];
//	[tempArray addObject:@"R"];
//	[tempArray addObject:@"S"];
//	[tempArray addObject:@"T"];
//	[tempArray addObject:@"U"];
//	[tempArray addObject:@"V"];
//	[tempArray addObject:@"W"];
//	[tempArray addObject:@"X"];
//	[tempArray addObject:@"Y"];
//	[tempArray addObject:@"2"];
//	
//	return tempArray;
//}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
	
	if(searching)
		return -1;
	
	return index % 2;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...UITableView
	if(searching) 
		cell.textLabel.text = [copyListOfItems objectAtIndex:indexPath.row];
	else {
	
	//First get the dictionary object
	NSDictionary *dictionary = [Items objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Countries"];
	NSString *cellValue = [array objectAtIndex:indexPath.row];
	cell.textLabel.text = cellValue;
	}
    return cell;	
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//Get the selected country
	
	NSString *selectedCountry = nil;
	
	if(searching)
		selectedCountry = [copyListOfItems objectAtIndex:indexPath.row];
	else
	{
	NSDictionary *dictionary = [Items objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"Countries"];
	selectedCountry = [array objectAtIndex:indexPath.row];
		
	}
	
	//Initialize the detail view controller and display it.
	DetailViewController *dvController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
	dvController.selectedCountry = selectedCountry;
	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
}

- (NSIndexPath *)tableView :(UITableView *)theTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(letUserSelectRow)
		return indexPath;
	else
		return nil;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{
	return UITableViewCellAccessoryDisclosureIndicator;
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath 
{
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark Search Bar 

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
	
	//This method is called again when the user clicks back from teh detail view.
	//So the overlay is displayed on the results, which is something we do not want to happen.
	if(searching)
		return;
	
	//Add the overlay view.
	if(ovController == nil)
		ovController = [[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:[NSBundle mainBundle]];
	
	CGFloat yaxis = self.navigationController.navigationBar.frame.size.height;
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	//Parameters x = origion on x-axis, y = origon on y-axis.
	CGRect frame = CGRectMake(0, yaxis, width, height);
	ovController.view.frame = frame;	
	ovController.view.backgroundColor = [UIColor grayColor];
	ovController.view.alpha = 0.5;
	
	ovController.rvController = self;
	
	[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
	
	searching = YES;
	letUserSelectRow = NO;
	self.tableView.scrollEnabled = NO;
	
	//Add the done button.
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
											   target:self action:@selector(doneSearching_Clicked:)] autorelease];
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
	
	//Remove all objects first.
	[copyListOfItems removeAllObjects];
	
	if([searchText length] > 0) {
		
		[ovController.view removeFromSuperview];
		searching = YES;
		letUserSelectRow = YES;
		self.tableView.scrollEnabled = YES;
		[self searchTableView];
	}
	else {
		
		[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
		
		searching = NO;
		letUserSelectRow = NO;
		self.tableView.scrollEnabled = NO;
	}
	
	[self.tableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar 
{
	
	[self searchTableView];
}

- (void) searchTableView {
	
	NSString *searchText = searchBar.text;
	NSMutableArray *searchArray = [[NSMutableArray alloc] init];
	
	for (NSDictionary *dictionary in Items)
	{
		NSArray *array = [dictionary objectForKey:@"Countries"];
		[searchArray addObjectsFromArray:array];
	}
	
	for (NSString *sTemp in searchArray)
	{
		NSRange titleResultsRange = [sTemp rangeOfString:searchText options:NSCaseInsensitiveSearch];
		
		if (titleResultsRange.length > 0)
			[copyListOfItems addObject:sTemp];
	}
	
	[searchArray release];
	searchArray = nil;
}

- (void) doneSearching_Clicked:(id)sender {
	
	searchBar.text = @"";
	[searchBar resignFirstResponder];
	
	letUserSelectRow = YES;
	searching = NO;
	self.navigationItem.rightBarButtonItem = nil;
	self.tableView.scrollEnabled = YES;
	
	[ovController.view removeFromSuperview];
	[ovController release];
	ovController = nil;
	
	[self.tableView reloadData];
}
  

- (void)dealloc 
{
	[ovController release];
	[copyListOfItems release];
	[searchBar release];
	[Items release];
    [super dealloc];
}


@end

