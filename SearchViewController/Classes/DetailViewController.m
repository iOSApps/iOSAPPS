//
//  DetailViewController.m
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright 2009 Rose India. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController
@synthesize selectedCountry;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	//Display the selected country.
	label.text = selectedCountry;
	
	//Set the title of the navigation bar
	self.navigationItem.title = @"Selected Country";
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

- (void)dealloc 
{
    [label release];
	[selectedCountry release];
	[super dealloc];
}


@end
