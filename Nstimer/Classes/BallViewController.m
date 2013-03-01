//
//  BallViewController.m
//  Ball
//
//  Created by Brandon Trebitowski on 10/27/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "BallViewController.h"

@implementation BallViewController

@synthesize ball;

/*
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/

-(void) onTimer {
	ball.center = CGPointMake(ball.center.x+pos.x,ball.center.y+pos.y);
	
	if(ball.center.x > 320 || ball.center.x < 0)
		pos.x = -pos.x;
	if(ball.center.y > 460 || ball.center.y < 0)
		pos.y = -pos.y;
}


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    pos = CGPointMake(14.0,7.0);
	
	[NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

@end
