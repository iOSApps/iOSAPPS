//
//  ViewController.m
//  Facebook
//
//  Created by Guest on 08/02/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtLink, txtCaption;

- (IBAction) btnPostPress:(id) sender {
	
	[self.txtLink resignFirstResponder];
	[self.txtCaption resignFirstResponder];
	
	//we will release this object when it is finished posting
	FBFeedPost *post = [[FBFeedPost alloc] initWithLinkPath:self.txtLink.text caption:self.txtCaption.text];
	[post publishPostWithDelegate:self];
	
	
}

#pragma mark -
#pragma mark FBFeedPostDelegate


#pragma mark -
#pragma mark LoadView

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Post A Link";
	
	UIBarButtonItem *btnPost = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStyleBordered
															   target:self action:@selector(btnPostPress:)];
	self.navigationItem.rightBarButtonItem = btnPost;
	
}


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


@end
