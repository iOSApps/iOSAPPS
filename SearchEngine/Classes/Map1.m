//
//  Map1.m
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Map1.h"


@implementation Map1
@synthesize map1,map2,map3,map4;



- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	
	lat=newLocation.coordinate.latitude;
	lng=newLocation.coordinate.longitude;
	//NSString *acc=[[NSString alloc]initWithFormat:@"%f",newLocation.horizontalAccuracy];
	dir=newLocation.course;
	/*MKCoordinateSpan span1;
	 span1.latitudeDelta=.002;
	 span1.longitudeDelta=.002;
	 MKCoordinateRegion region1;
	 region1.center=newLocation.coordinate;
	 region1.span=span1;
	 [mapview setRegion:region1 animated:TRUE];
	 if(loc)
	 {
	 [loc moveannotation:newLocation.coordinate];
	 }
	 else {
	 loc=[[Location alloc]initwithcoordinate:newLocation.coordinate title1:@"you are here" subtitle1:@"welcome to tis place"];
	 
	 }*/
	
	
	
	
	
	
 }
/*-(CLLocationCoordinate2D)addressLocation
{
	CLLocationCoordinate2D cc;
	//cc.latitude=17.44444;
	//cc.longitude=78.54225;
	//self.lat;
	//self.longtd;
	cc.latitude=lat;
	cc.longitude=lng;
	return cc;
}*/

-(CLLocationCoordinate2D)addressLocation
{
	CLLocationCoordinate2D cc;
	cc.latitude=lat;
	cc.longitude=lng;
	return cc;
}

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
	/*self.lm=[[CLLocationManager alloc]init];
	 lm.delegate=self;
	 lm.desiredAccuracy=kCLLocationAccuracyBest;
	 lm.distanceFilter=kCLDistanceFilterNone;
	 [lm startUpdatingLocation];*/
	
	
	/*mapview=[[MKMapView alloc]initWithFrame:CGRectMake(-90, -80, 500, 500)];
	 mapview.delegate=self;
	 mapview.mapType=MKMapTypeHybrid;
	 [self.viewformap addSubview:mapview];
	 [NSThread detachNewThreadSelector:@selector(displayMYMap) toTarget:self withObject:nil];
	 */
	mapview=[[MKMapView alloc]initWithFrame:self.view.bounds];
	mapview.mapType=MKMapTypeHybrid;
	mapview.showsUserLocation=YES;//hybrid means showing roads nd ol,inplace of hybrid,olso satellite,standard r there
	//double x=(double)2;
	///NSNumber *num=[[NSNumber alloc]initWithFloat:[NSString stringWithFormat:@"%f",map1]];
	//NSNumber *num=[[NSNumber 
	//NSNumber *num1=[[NSNumber alloc]initWithFloat:[NSString stringWithFormat:@"%f",map2]];
	double loanAmount = [map1 doubleValue];
	double loanAmount1 =[map2 doubleValue];
	CLLocationCoordinate2D coord={latitude:loanAmount,longitude:loanAmount1};
	MKCoordinateSpan span={latitudeDelta:0.2,longitudeDelta:0.2};
	MKCoordinateRegion region={coord,span};
	[mapview setRegion:region];
	[self.view addSubview:mapview];
	
	//mapview.showsUserLocation=YES;
	if(annotation!=nil)
	{
		[mapview removeAnnotation:annotation];
		[annotation release];
		annotation=nil;
		
	}
	annotation=[[Annotation alloc]initwithcoordinate:coord title:map3 subtitle:map4];
	[mapview addAnnotation:annotation];
	
	/*double loanAmount = [map1 doubleValue];
	double loanAmount1 =[map2 doubleValue];
	//CLLocationCoordinate2D coord={ latitude=loanAmount,longitude=loanAmount1};
	CLLocationCoordinate2D coord1={latitude=loanAmount,longitude=loanAmount1};
	MKCoordinateSpan span={latitudeDelta:0.2,longitudeDelta:0.2};
	MKCoordinateRegion region={coord1,span};
	[mapview setRegion:region];
	[self.view addSubview:mapview];
	
	//mapview.showsUserLocation=YES;
	if(annotation!=nil)
	{
		[mapview removeAnnotation:annotation];
		[annotation release];
		annotation=nil;
		
	}
	annotation=[[Annotation alloc]initwithcoordinate:coord1 title:map3 subtitle:map4];
	[mapview addAnnotation:annotation];
	
	/*locationManager = [[CLLocationManager alloc] init];
	 locationManager.delegate = self;
	 locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
	 locationManager.desiredAccuracy =kCLLocationAccuracyBestForNavigation;  // kCLLocationAccuracyHundredMeters; // 100 m
	 
	 if(![CLLocationManager locationServicesEnabled])
	 {	UIAlertView *msg=[[[UIAlertView alloc] initWithTitle:@"Location Services" message:@"Location Services Are Not Enabled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]autorelease ];
	 [msg show];
	 }	
	 [locationManager startUpdatingLocation];
	 
	 MKCoordinateRegion region1;
	 MKCoordinateSpan span1;
	 span1.latitudeDelta=0.2;
	 span1.longitudeDelta=0.2;
	 
	 CLLocationCoordinate2D location = [self addressLocation];
	 region1.span=span1;
	 region1.center=location;
	 if(loc != nil) {
	 [mapview removeAnnotation:loc];
	 [loc release];
	 loc = nil;
	 
	 }
	 
	 loc = [[Location alloc] initWithCoordinate:location title1:@"you are here" subtitle1:@"welcome to tis place"];//putting the marker on map..that will change wn location changes
	 
	 [mapview addAnnotation:loc];
	 
	 NSLog(@"hello");
	 
	 [mapview setRegion:region1 animated:TRUE];
	 NSLog(@"bye");
	 
	 //[mapView regionThatFits:region];
	 [self.view addSubview:mapview];
	 
	 
	 
	 
	 
	 /*CLLocationCoordinate2D annotationCoord;
	 
	 annotationCoord.latitude = 47.640071;
	 annotationCoord.longitude = -122.129598;
	 
	 MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
	 annotationPoint.coordinate = annotationCoord;
	 annotationPoint.title = @"Microsoft";
	 annotationPoint.subtitle = @"Microsoft's headquarters";
	 [mapView addAnnotation:annotationPoint]*/
	/*CLLocationCoordinate2D annotationcoord;
	 annotationcoord.latitude=loanAmount;
	 annotationcoord.longitude=loanAmount1;
	 MKPointAnnotation *annotationpoint=[[MKPointAnnotation alloc]init];
	 annotationpoint.coordinate=annotationcoord;
	 [annotationpoint title:@"hai"];
	 [annotationpoint subtitle:@"bye"];
	 [mapview addAnnotation:annotationpoint];*/
	
	NSLog(@"%@",map3);
	
    [super viewDidLoad];
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
