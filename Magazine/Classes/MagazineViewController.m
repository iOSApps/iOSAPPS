//
//  MagazineViewController.m
//  Magazine
//
//  Created by siva kumar on 12/10/33.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MagazineViewController.h"
#import "CreatingAccount.h"
#import "Shop.h"
#import "MoreDetails.h"

@implementation MagazineViewController





// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//Label animation
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 335, 320, 70)];
	[myLabel setTextAlignment:UITextAlignmentCenter];
	[myLabel setBackgroundColor:[UIColor clearColor]];
	[myLabel setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:50.0 ]];
	[myLabel setTextColor:[UIColor redColor]];
	[myLabel setText: @"Magazine"];
	[myLabel setAlpha:0.0];
	
	[self.view addSubview:myLabel];
    [self.view bringSubviewToFront:myLabel];
    
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.2];
	[UIView setAnimationRepeatAutoreverses:YES];
	[UIView setAnimationRepeatCount:100.0];
	[myLabel setAlpha: 0.9];
	[UIView commitAnimations];
    
    
       
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 416, 320, 44)];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"MyLibrary" image:[UIImage imageNamed:@"tab1.png" ] tag:0];
   // [item1 setBadgeValue:@"MyLibrary"];
    UITabBarItem *item2  = [[UITabBarItem alloc] initWithTitle:@"Shop" image:[UIImage imageNamed:@"tab2.png"] tag:1];
  //  [item2 setBadgeValue:@"Shop"];
    
    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:@"More.." image:[UIImage imageNamed:@"tab3.png"] tag:2];
  //  [item3 setBadgeValue:@"More.."];
	//UITabBar *item3=[[UITabBarItem alloc]initWithTitle:@"More" image:[UIImage  tag:<#(NSInteger)tag#>
    
	NSArray *items = [NSArray arrayWithObjects:item1,item2,item3, nil];
    [tabBar setItems:items animated:YES];
    [tabBar setSelectedItem:nil];
    tabBar.delegate=self;
    
    [self.view addSubview:tabBar];
    [super viewDidLoad];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item { 
    MoreDetails *a;
    NSLog(@"Tab tab: %d",item.tag);
    switch (item.tag) {
        case 0:
			a=[[MoreDetails alloc]initWithNibName:@"MoreDetails" bundle:nil];
            [self presentModalViewController:a animated:YES];
            break;
        case 1:
            //b=[[Shop alloc]initWithNibName:@"Shop" bundle:nil];
            //[self presentModalViewController:b animated:YES];
            u=[[UIAlertView alloc]initWithTitle:@"" message:@"Please sign in..." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [u show];
            break;
		case 2:
            a=[[MoreDetails alloc]initWithNibName:@"MoreDetails" bundle:nil];
            [self presentModalViewController:a animated:YES];
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
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
