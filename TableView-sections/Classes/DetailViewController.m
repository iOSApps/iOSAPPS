//
//  DetailViewController.m
//  TableView
//
//  Created by Jai Kirdatt on 1/17/09.
//  Copyright www.iPhoneSDKArticles.com 2009. 
//

#import "DetailViewController.h"


@implementation DetailViewController

@synthesize selectedCountry;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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
	
	//Display the selected country.
	lblText.text = selectedCountry;
	
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
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	
	[selectedCountry release];
	[lblText release];
    [super dealloc];
}


@end
