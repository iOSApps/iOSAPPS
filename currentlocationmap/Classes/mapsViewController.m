//
//  mapsViewController.m
//  maps
//
//  Created by vanita on 23/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "mapsViewController.h"

@implementation mapsViewController
@synthesize mapview,toolBar;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	mapview.delegate = self;
	mapview.showsUserLocation = YES;
	UIBarButtonItem *zoomButton = 
	[[UIBarButtonItem alloc]
	 initWithTitle: @"Zoom"
	 style:UIBarButtonItemStylePlain
	 target: self
	 action:@selector(zoomIn:)];
	
	UIBarButtonItem *typeButton = 
	[[UIBarButtonItem alloc]
	 initWithTitle: @"Type"
	 style:UIBarButtonItemStylePlain
	 target: self
	 action:@selector(changeMapType:)];
	
	NSArray *buttons = [[NSArray alloc] 
						initWithObjects:zoomButton, typeButton, nil];
	
	toolBar.items = buttons;
	CLLocationCoordinate2D annotationCoord;
	
	annotationCoord.latitude = 12.9833;
	annotationCoord.longitude =77.5833;
	
	MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
	annotationPoint.coordinate = annotationCoord;
	annotationPoint.title = @"BANGALORE";
	annotationPoint.subtitle = @"AMBUJEX";
	[mapview addAnnotation:annotationPoint]; 
	
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)mapView:(MKMapView *)mapView 
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
	self.mapview.centerCoordinate = 
	userLocation.location.coordinate;
} 
- (void)zoomIn: (id)sender
{
	MKUserLocation *userLocation = mapview.userLocation;
	MKCoordinateRegion region =
	MKCoordinateRegionMakeWithDistance (
										userLocation.location.coordinate, 50, 50);
	[mapview setRegion:region animated:NO];
}
- (void) changeMapType: (id)sender
{
	if (mapview.mapType == MKMapTypeStandard)
		mapview.mapType = MKMapTypeSatellite;
	else
		mapview.mapType = MKMapTypeStandard;
} 


 - (void)viewDidUnload
 {
 [super viewDidUnload];
 // Release any retained subviews of the main view.
 }
 
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 {
 return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
 }
 

 



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
	

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

//- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
//}


- (void)dealloc {
    [super dealloc];
}

@end
