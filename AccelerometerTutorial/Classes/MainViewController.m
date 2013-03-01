//
//  MainViewController.m
//  AccelerometerTutorial
//
//  Created by Brandon Cannaday on 8/5/09.
//  Copyright 2009 Paranoid Ferret Productions. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

@synthesize labelX;
@synthesize labelY;
@synthesize labelZ;

@synthesize progressX;
@synthesize progressY;
@synthesize progressZ;

@synthesize accelerometer;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.accelerometer = [UIAccelerometer sharedAccelerometer];
  self.accelerometer.updateInterval = .1;
  self.accelerometer.delegate = self;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
  labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
  labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
  labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
  
  self.progressX.progress = ABS(acceleration.x);
  self.progressY.progress = ABS(acceleration.y);
  self.progressZ.progress = ABS(acceleration.z);
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
