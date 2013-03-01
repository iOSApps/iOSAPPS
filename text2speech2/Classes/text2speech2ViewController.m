//
//  text2speech2ViewController.m
//  text2speech2
//
//  Created by Snow Leopard User on 03/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "text2speech2ViewController.h"
#import "class1.h"

@implementation text2speech2ViewController


@synthesize t1,str1;
-(IBAction)choose
{
	str1=[[NSString alloc]initWithFormat:@"%@",t1.text];
	NSLog(@"%@",self.str1);
	class1 *obj1=[[class1 alloc]initWithNibName:@"class1" bundle:nil];
	obj1.str2=self.str1;
	[self presentModalViewController:obj1 animated:YES];
	
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
