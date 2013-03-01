//
//  imageinplistViewController.m
//  imageinplist
//
//  Created by sandeep on 05/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "imageinplistViewController.h"
#import"first.h"
@implementation imageinplistViewController
@synthesize mybutton;
@synthesize mybutton1;






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
	
	mybutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[mybutton setTitle:@"adding" forState:UIControlStateNormal];
	mybutton.frame=CGRectMake(10,420, 100,30 );
	[mybutton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:mybutton];
	
	mybutton1=[UIButton buttonWithType:UIButtonTypeCustom];
	[mybutton1 setTitle:@"details" forState:UIControlStateNormal];
	mybutton1.frame=CGRectMake(20, 300, 100, 30);
	[mybutton1 addTarget:self action:@selector(show1) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:mybutton1];

		
}

-(void)show
{
	first *s=[[first alloc]initWithNibName:@"first" bundle:nil];
	[self presentModalViewController:s animated:YES];
	[s release];
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
