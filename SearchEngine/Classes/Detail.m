//
//  Detail.m
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Detail.h"


@implementation Detail
@synthesize tv,ar3,strin,strin1,strin2,strin0;

/*-(IBAction)back:(id)sender
{
	//RootViewController *r=[[RootViewController alloc];
						   //[self.view addSubview:r];
	//RootViewController *loc=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
	//[[self navigationController]popViewControllerAnimated:YES];
	
}
*/
-(IBAction)map:(id)sender
{
	Map1 *m=[[Map1 alloc]initWithNibName:@"Map" bundle:nil];
	
	m.map1=self.strin1;
	m.map2=self.strin2;
	m.map3=self.strin0;
	m.map4=self.strin;
	//m.x2=self.x1;
	//m.y2=self.y1;
	//n(@"%@",strin1);
	
	[[self navigationController]pushViewController:m animated:YES];
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
	tv.text=strin;
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
