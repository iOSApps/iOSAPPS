//
//  ADD_with_subviewViewController.m
//  ADD_with_subview
//
//  Created by saurabhkumar on 27/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ADD_with_subviewViewController.h"
#import "add.h"
@implementation ADD_with_subviewViewController


@synthesize t1;
@synthesize t2;
@synthesize t3;

int res;

-(BOOL)textFieldShouldReturn: (UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
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


-(IBAction)add
{
	add *a1=[[add alloc]initWithNibName:@"add" bundle:nil];
	
	[self presentModalViewController:a1 animated:YES];
	
	int x,y,z;
	x=[t1.text intValue];
	y=[t2.text intValue];
	z=[t3.text intValue];
	res=(x+y+z);
	a1.l1.text=[NSString stringWithFormat:@"%i",res];
	[a1 release];
	 
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
