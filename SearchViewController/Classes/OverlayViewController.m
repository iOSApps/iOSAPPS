//
//  OverlayViewController.m
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright 2009 Rose India. All rights reserved.
//

#import "OverlayViewController.h"
#import "RootViewController.h"


@implementation OverlayViewController
@synthesize rvController;



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	
	[rvController doneSearching_Clicked:nil];
}

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc 
{
[rvController release];
    [super dealloc];
}


@end
