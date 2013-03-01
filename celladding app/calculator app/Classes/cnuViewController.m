//
//  cnuViewController.m
//  cnu
//
//  Created by sandeep on 23/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cnuViewController.h"

@implementation cnuViewController
@synthesize text1;
@synthesize text2;
@synthesize label;
@synthesize x,y;


-(BOOL)textFieldShouldReturn:(UITextField *)textField
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(IBAction)add
{
	x=[text1.text intValue];
	y=[text2.text intValue];
	result=x+y;
	NSString *value=[NSString stringWithFormat:@"%d",result];
	label.text=value;
}

-(IBAction)sub
{
	x=[text1.text intValue];
	y=[text2.text intValue];
	result=x-y;
	NSString *value=[NSString stringWithFormat:@"%d",result];
	label.text=value;
}

-(IBAction)mul
{
	x=[text1.text intValue];
	y=[text2.text intValue];
	result=x*y;
	NSString *value=[NSString stringWithFormat:@"%d",result];
	label.text=value;
}
-(IBAction)div
{
	x=[text1.text intValue];
	y=[text2.text intValue];
	result=x/y;
	NSString *value=[NSString stringWithFormat:@"%d",result];
	label.text=value;
}
-(IBAction)done
{
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

/*-(IBAction)add
{
	x=[text1.text intValue];
	y=[text2.text intValue];
	result=x+y;
	NSString *value=[NSString string with format:@"%d",result];
	label.text=value;
}*/

	

@end
