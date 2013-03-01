//
//  newViewController.m
//  new
//
//  Created by sandeep on 29/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "newViewController.h"
#import"hi.h"

@implementation newViewController
@synthesize a,navBar;



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	
	
	a=[[NSMutableArray alloc]initWithObjects:@"hi",@"bye",nil];
		//UIBarButtonItem  *a11=[[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStyleBordered target:self action:	@selector(add)];
	//self.navigationItem.rightBarButtonItem=self.editbutton;
	
     navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0,320,40)]; 
	[self.view addSubview:navBar];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
																	style:UIBarButtonSystemItemDone
																   target:nil 
																   action:@selector(add)];
	UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Title"];
	item.rightBarButtonItem = rightButton;
	//item.hidesBackButton = YES;
	[navBar pushNavigationItem:item animated:NO];
	[rightButton release];
	[item release];
	//UINavigationItem *nav=[[UINavigationItem alloc]initWithTitle:@"hi"];
	
	
	//self.navigationItem.leftBarButtonItem=nav;
     //navBar.delegate = self;
	
	//self.navigationItem.rightBarButtonItem=backItem;
	

}

-(void)add
{
	hi *sa=[[hi alloc]initWithNibName:@"hi" bundle:nil];
	[self presentModalViewController:sa animated:YES];
	
	navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0,320,40)]; 
	[self.view addSubview:navBar];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
																	style:UIBarButtonSystemItemDone target:nil action:@selector(add)];
	UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Title"];
	item.rightBarButtonItem = rightButton;
	item.hidesBackButton = NO;
	[navBar pushNavigationItem:item animated:YES];
	[rightButton release];
	[item release];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [a count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.textLabel.text=[a objectAtIndex:indexPath.row];
    
	// Configure the cell.
	
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
		//[a removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
