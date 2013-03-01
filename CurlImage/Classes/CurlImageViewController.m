//
//  CurlImageViewController.m
//  CurlImage
//
//  Created by Deepak Kumar on 22/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "CurlImageViewController.h"

#define kImageHeight		200.0
#define kImageWidth			250.0
#define kTransitionDuration	0.75
#define kTopPlacement		80.0

@implementation CurlImageViewController

@synthesize containerView, mainView, curlToView;

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
- (void)dealloc
{
	[mainView release];
	[curlToView release];
	[containerView release];
	
	[super dealloc];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = NSLocalizedString(@"TransitionsTitle", @"");
	
	// create the container view which we will use for transition animation (centered horizontally)
	CGRect frame = CGRectMake(round((self.view.bounds.size.width - kImageWidth) / 2.0),
							  kTopPlacement, kImageWidth, kImageHeight);
	self.containerView = [[[UIView alloc] initWithFrame:frame] autorelease];
	[self.view addSubview:self.containerView];
	
	// create the initial image view
	frame = CGRectMake(0.0, 0.0, kImageWidth, kImageHeight);
	self.mainView = [[[UIImageView alloc] initWithFrame:frame] autorelease];
	self.mainView.image = [UIImage imageNamed:@"Wonder.jpg"];
	[self.containerView addSubview:self.mainView];
	
	// create the alternate image view (to transition between)
	CGRect imageFrame = CGRectMake(0.0, 0.0, kImageWidth, kImageHeight);
	self.curlToView = [[[UIImageView alloc] initWithFrame:imageFrame] autorelease];
	self.curlToView.image = [UIImage imageNamed:@"Screen1.jpg"];
}

// called after the view controller's view is released and set to nil.
// For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
// So release any properties that are loaded in viewDidLoad or can be recreated lazily.
//
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	self.containerView = nil;
	self.curlToView = nil;
	self.mainView = nil;
}

- (IBAction)curlAction:(id)sender
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:kTransitionDuration];
	
	[UIView setAnimationTransition:([self.mainView superview] ?
									UIViewAnimationTransitionCurlUp : UIViewAnimationTransitionCurlDown)
						   forView:self.containerView cache:YES];
	if ([self.curlToView superview])
	{
		[self.curlToView removeFromSuperview];
		[self.containerView addSubview:self.mainView];
	}
	else
	{
		[self.mainView removeFromSuperview];
		[self.containerView addSubview:self.curlToView];
	}
	
	[UIView commitAnimations];
}


@end


