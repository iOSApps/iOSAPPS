//
//  TutorialProjectViewController.m
//  TutorialProject
//
//  Created by Ondrej Rafaj on 5.8.09.
//  Copyright Home 2009. All rights reserved.
//

#import "TutorialProjectViewController.h"

@implementation TutorialProjectViewController

@synthesize threadValueLabel, threadProgressView, testValueLabel, threadStartButton;

// ------ Tutorial code starts here ------

- (IBAction) startThreadButtonPressed:(UIButton *)sender {
	
	threadStartButton.hidden = YES;
	threadValueLabel.text = @"0";
	threadProgressView.progress = 0.0;
	[NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
	
}

- (void)startTheBackgroundJob {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	// wait for 3 seconds before starting the thread, you don't have to do that. This is just an example how to stop the NSThread for some time
	[NSThread sleepForTimeInterval:3];
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    [pool release];
	
}

- (void)makeMyProgressBarMoving {
    
	float actual = [threadProgressView progress];
	threadValueLabel.text = [NSString stringWithFormat:@"%.2f", actual];
	if (actual < 1) {
		threadProgressView.progress = actual + 0.01;
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(makeMyProgressBarMoving) userInfo:nil repeats:NO];
	}
	else threadStartButton.hidden = NO;
	
}

- (IBAction) testValueSliderChanged:(UISlider *)sender {
	
	testValueLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
	
}

// ------ Tutorial code ends here ------


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


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


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

// This function is for button which takes you to the xprogress.com website
- (IBAction) runXprogressComButton: (id) sender {
	NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.xprogress.com/" ];
	[[UIApplication sharedApplication] openURL:url];
}


- (void)dealloc {
    
	// ------ Tutorial code starts here ------
	
	[threadValueLabel release];
	[threadProgressView release];
	[threadStartButton release];
	
	[testValueLabel release];
	
	// ------ Tutorial code ends here ------
	
	[super dealloc];
}

@end
