//  SegmentViewController.m
//  Segment
//  Created by Deepak Kumar on 22/08/09.
//  Copyright Rose India 2009. All rights reserved.

#import "SegmentViewController.h"
#import"abc.h"

@implementation SegmentViewController

// segment action

- (void) segmentAction:(id)sender 
{
	UISegmentedControl* segCtl = sender ;
	if( [segCtl selectedSegmentIndex] == 0 )
	{
		abc *a=[[abc alloc]init];
		[ self.view addSubview:a.view];
		
		NSLog(@"1");
	}

	if( [segCtl selectedSegmentIndex] == 1 ) 
	{

		NSLog(@"2");
	}
	if( [segCtl selectedSegmentIndex] == 2 ) 
	{
		
		NSLog(@"3");
	}
	
}

- (void)viewDidLoad 
{
	[super viewDidLoad];
	// the segment control…
	[myMent addTarget:self action:@selector(segmentAction:)
		forControlEvents:UIControlEventValueChanged];
	//myMent.selectedSegmentIndex = 0 ;

}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
 {
        // Custom initialization
    }
    return self;
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
 {
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
