//
//  AlertViewViewController.m
//  AlertView
//
//  Created by sandeep on 16/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AlertViewViewController.h"
#import"next.h"

@implementation AlertViewViewController



-(IBAction)button
{
	UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"loginpage"
													 delegate:self
											cancelButtonTitle:@"cancel"
									   destructiveButtonTitle:@"hi"
											otherButtonTitles:@"one",@"two",nil];
	[action showInView:self.view];
		
	/*UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"loginpage"
												 message:@"passwordwrong"
												delegate:self
									   cancelButtonTitle:@"cancel"
									   otherButtonTitles:@"one",@"two",nil];
	[alert show];*/
	 
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex==1)
	{
		NSLog(@"bye");
	}
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex==1){
		NSLog(@"hi");
	}
	if(buttonIndex==2) {
		
		next *a=[[next alloc]initWithNibName:@"next" bundle:nil];
		[self presentModalViewController:a animated:YES];
	}

}



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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


- (void)dealloc {
    [super dealloc];
}

@end
