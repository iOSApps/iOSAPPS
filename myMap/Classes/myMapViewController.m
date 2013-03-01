//
//  myMapViewController.m
//  myMap
//
//  Created by Neelam Roy on 8/6/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//


#import "myMapViewController.h"

@implementation myMapViewController


@synthesize myMapView;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
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
	
	myMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];  
    myMapView.delegate=self;  
	
    [self.view addSubview:myMapView];  
    [NSThread detachNewThreadSelector:@selector(displayMYMap) toTarget:self withObject:nil]; 
	
}


-(void)displayMYMap
{
	MKCoordinateRegion region;  
    MKCoordinateSpan span;  
    span.latitudeDelta=0.2;  
    span.longitudeDelta=0.2;  
	
    CLLocationCoordinate2D location;  
   
	location.latitude = 12.9715987;
	
	location.longitude = 77.5945627;;
	
		
    region.span=span;  
    region.center=location;  
	
    [myMapView setRegion:region animated:TRUE];  
    [myMapView regionThatFits:region];  
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
	[myMapView release];
}

@end
