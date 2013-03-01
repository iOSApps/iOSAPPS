//
//  RootViewController.m
//  celladding
//
//  Created by suhas on 23/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController
//@synthesize cell;
@synthesize table1;
//@synthesize array;
//@synthesize indexPath;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	UIBarButtonItem *button=[[UIBarButtonItem alloc]initWithTitle:@"Add"
															style:UIBarButtonItemStyleDone
														   target:self
														   action:@selector(addItem)];
	self.navigationItem.rightBarButtonItem=button;
	
	UIBarButtonItem *button1=[[UIBarButtonItem alloc]initWithTitle:@"Remove"
															style:UIBarButtonItemStyleDone
														   target:self
														   action:@selector(RemoveItem)];
																	
	self.navigationItem.leftBarButtonItem=button1;
	
	
	

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

static int i=0;
-(void)addItem
{
	// i=indexPath.length;
	i++;
	if(i==1)
	{
	
	table1=[[UITableView alloc]initWithFrame:CGRectMake(0,0,320,45*i) style:UITableViewStylePlain];
	//table1.backgroundColor=[UIColor redColor];
	[self.view addSubview:table1];	
	[self.table1 reloadData];
	}
	
	else  if(i>1)
	{
		table1.frame = CGRectMake(0,0,320,45*i);
		[self.table1 reloadData];
	}
		//static NSString *CellIdentifier = @"Cell";
	
	//self.cell=[[UITableViewCell alloc]initWithFrame:CGRectZero];
	/*self.array=[[NSMutableArray alloc]init];

	[self.array addObject:self.cell];*/
	
	//self.cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if (self.cell == nil) {
       // self.cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    
	//cell.textLabel.text=@"hi";
	
}

-(void)RemoveItem
{
	
	i--;
	NSLog(@"i %d",i);
	//[table1 deleteRowsAtIndexPaths: withRowAnimation:UITableViewRowAnimationFade];
	if(i>=0)
	{
	table1.frame = CGRectMake(0,0,320,45*i);
	}
	else if(i==-1)
	{
		i=i+1;
	}
	
	
	[self.table1 reloadData];
}
	


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return i;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	//cell.backgroundColor=[UIColor yellowColor];
	//ell.textLabel.text=[self.array objectAtIndex:];
    
	// Configure the cell.

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		

        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
//}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[table1 release];
}


@end

