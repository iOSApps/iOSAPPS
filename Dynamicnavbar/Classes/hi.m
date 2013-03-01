//
//  hi.m
//  new
//
//  Created by sandeep on 29/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "hi.h"


@implementation hi
@synthesize t,b,l;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	t=[[UITextField alloc]initWithFrame:CGRectMake(30, 40, 100, 50)];
	t.placeholder=@"textfield";
	[self.view addSubview:t];
	
	l=[[UILabel alloc]initWithFrame:CGRectMake(40, 60, 50, 50)];
	l.text=@"label";
	[self.view addSubview:l];
	
	b=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[b setTitle:@"adding" forState:UIControlStateNormal];
	b.frame=CGRectMake(10,420, 100,30 );
	[b addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b];
	
	
	UINavigationBar   *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0,320,40)]; 
	[self.view addSubview:navBar];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
																	style:UIBarButtonSystemItemDone target:nil action:@selector(add)];
	UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Title"];
	item.leftBarButtonItem = rightButton;
	item.hidesBackButton = NO;
	[navBar pushNavigationItem:item animated:YES];
	[rightButton release];
	[item release];
}
-(void)add
{
	[self dismissModalViewControllerAnimated:YES];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
