//
//  saveViewController.m
//  save
//
//  Created by sandeep on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "saveViewController.h"
#import"s1.h"

@implementation saveViewController
@synthesize t1;



-(IBAction)save
{
	
	
	NSString *path=[[NSBundle mainBundle]pathForResource:@"p" ofType:@"plist"];
	NSArray *docpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *filePath = [[docpath objectAtIndex:0]stringByAppendingPathComponent:@"p.plist"];
	NSFileManager *myfile=[NSFileManager defaultManager];
	BOOL s=[myfile fileExistsAtPath:filePath];
	NSLog(@"file exist or not %d",s);
	if (s==0) {
		BOOL d=[myfile copyItemAtPath:path toPath:filePath error:nil];
		if (d) {
			NSLog(@"file copied");
		}
		else {
			NSLog(@"file not copied");
		}
	}
	
	NSMutableArray *ar=[NSMutableArray arrayWithContentsOfFile:filePath];
	
	[ar addObject:[NSString stringWithFormat:@"%@",t1.text]];
	[ar writeToFile:filePath atomically:YES];
	NSLog(@"plist %@",filePath);
	
	
	s1 *q=[[s1 alloc]initWithNibName:@"s1" bundle:nil];
	[self presentModalViewController:q animated:YES];
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
