//
//  jsontestingViewController.m
//  jsontesting
//
//  Created by srama on 28/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "jsontestingViewController.h"
#import "JSON.h"
@implementation jsontestingViewController
@synthesize jsonArray,table,u,ar;

- (void)viewDidLoad {
	// Add the following line if you want the list to be editable
	// self.navigationItem.leftBarButtonItem = self.editButtonItem;
	ar=[[NSMutableArray alloc]initWithObjects:nil];
	// init the url
	NSURL *jsonURL = [NSURL URLWithString:@"http://daveriver.scripting.com/index.json"];
	NSLog(@"%@",jsonURL);
	NSString *jsonData = [[NSString alloc] initWithContentsOfURL:jsonURL];
	//NSLog(@"%@",jsonData);
	NSDictionary *datadictionary=[[jsonData JSONValue]objectForKey:@"updatedFeeds"];
	//NSLog(@"json %@",datadictionary);
	NSDictionary *dic=[[NSDictionary alloc]init];//[datadictionary objectForKey:@"updatedFeed"]];
	
	dic=[datadictionary objectForKey:@"updatedFeed"];
	
	NSArray *t1=[[NSArray alloc]initWithObjects:dic,nil];
	NSLog(@"json %@",dic);
	for (int i=0;i<[dic count]; i++) {
		NSDictionary *t=[[NSDictionary alloc]init];
		t=[[dic objectAtIndex:i]objectForKey:@"feedTitle"];
		//NSLog(@"%@",t);
		[ar addObject:t];
		
		/*for (int j=0; j<[t count]; j++) {
		 u=[[NSDictionary alloc]init];
		 u=[[t objectAtIndex:j]objectForKey:@"body"];
		 NSLog(@"%@",u);
		 jsonArray=[[NSMutableArray alloc]initWithObjects:u,nil];
		 NSLog(@"%@",jsonArray);
		 for (int h=0; h<[jsonArray count]; h++) {
		 NSLog(@"%@",[jsonArray objectAtIndex:h]);
		 
		 [table reloadData];
		 }	
		 }	*/
		
	
	NSLog(@"dfsffdf%@",ar);
	//[table reloadData];
}
}
-(IBAction)click{
	
	ta *u1=[[ta alloc]initWithNibName:@"ta" bundle:nil];
	u1.t=self.ar;
	[self presentModalViewController:u1 animated:YES];
	
}
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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
