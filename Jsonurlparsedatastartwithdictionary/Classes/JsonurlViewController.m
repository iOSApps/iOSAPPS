//
//  JsonurlViewController.m
//  Jsonurl
//
//  Created by aslam on 28/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "JsonurlViewController.h"
#import "JSON.h"

@implementation JsonurlViewController


@synthesize jsonarray,r,array;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Add the following line if you want the list to be editable
	// self.navigationItem.leftBarButtonItem = self.editButtonItem;
	array=[[NSMutableArray alloc]initWithObjects:nil];
	// init the url
	NSURL *jsonURL = [NSURL URLWithString:@"http://daveriver.scripting.com/index.json"];
	//NSLog(@"%@",jsonURL);
	NSString *jsonData = [[NSString alloc] initWithContentsOfURL:jsonURL];
	//NSLog(@"%@",jsonData);
	NSDictionary *datadictionary=[[jsonData JSONValue]objectForKey:@"updatedFeeds"];
	//NSLog(@"json %@",datadictionary);
NSDictionary *dic=[[NSDictionary alloc]init];//[datadictionary objectForKey:@"updatedFeed"]];
	
	dic=[datadictionary objectForKey:@"updatedFeed"];
	jsonarray=[[NSMutableArray alloc]initWithObjects:nil];
	
	NSArray *t1=[[NSArray alloc]initWithObjects:dic,nil];
	//NSLog(@"json %@",dic);
	for (int i=0;i<[dic count]; i++) {
		NSDictionary *r1=[[NSDictionary alloc]init];
		r1=[[dic objectAtIndex:i]objectForKey:@"item"];
		//NSLog(@"%@",t);
		[array addObject:r1];
	/*	NSDictionary *dic=[[NSDictionary alloc]init];//[datadictionary objectForKey:@"updatedFeed"]];
		
		dic=[datadictionary objectForKey:@"item"];
		
		NSArray *t2=[[NSArray alloc]initWithObjects:dic,nil];*/
		//NSLog(@"json %@",dic);
		for (int j=0;j<[r1 count]; j++) {
			NSDictionary *r2=[[NSDictionary alloc]init];
			r2=[[r1 objectAtIndex:j]objectForKey:@"pubDate"];
			//NSLog(@"%@",t);
			[jsonarray addObject:r2];
			NSLog(@"%@",jsonarray);
			//[array addObject:r1];
			/*for (int j=0; j<[r1 count]; j++) 
		{
		 NSDictionary *r3=[[NSDictionary alloc]init];
		 r3=[[r1 objectAtIndex:j]objectForKey:@"pubDate"];
		 //NSLog(@"%@",r1);
			[array addObject:r1];*/
		}
	}
}
	
	

-(IBAction)click
	{
	
	Table *ra=[[Table alloc]initWithNibName:@"Table" bundle:nil];
	ra.r1=self.jsonarray;
	[self presentModalViewController:ra animated:YES];
	
}


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


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

/*- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}*/

/*- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}*/


/*- (void)dealloc {
    [super dealloc];
}*/

@end
