//
//  IndainRailWayPNRStatusViewController.m
//  IndainRailWayPNRStatus
//
//  Created by venkat on 10/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IndainRailWayPNRStatusViewController.h"

@implementation IndainRailWayPNRStatusViewController

@synthesize pnrTextField_,pnrNumberString_;
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
-(IBAction)statusButtonClick:(id)sender
{
	pnrNumberString_=[[NSString alloc]initWithFormat:@"%@",pnrTextField_.text];
	PNRStatusDetailView *pnrDetailview=[[PNRStatusDetailView alloc]initWithNibName:@"PNRstatusDetailView" bundle:nil];
	pnrDetailview.pinString_=self.pnrNumberString_;
	[self presentModalViewController:pnrDetailview animated:YES];
	[pnrDetailview release];
	[pnrNumberString_ release];
	pnrTextField_.text=nil;
	
	
	
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
	[pnrNumberString_ release];
	[pnrTextField_ release];
    [super dealloc];
}

@end
