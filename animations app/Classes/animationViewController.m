//
//  animationViewController.m
//  animation
//
//  Created by sandeep on 04/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "animationViewController.h"

@implementation animationViewController
@synthesize myimage;
@synthesize mybutton;
@synthesize mybutton1; 
@synthesize mybutton2; 


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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	myimage=[[UIImageView alloc]initWithFrame:CGRectMake(60, 100, 40, 50)];
	myimage.image=[UIImage imageNamed:@"7.png"];
	myimage.backgroundColor=[UIColor redColor];
	[self.view addSubview:myimage];
	mybutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[mybutton setTitle:@"rotate" forState:UIControlStateNormal];
	mybutton.frame=CGRectMake(10,420, 100,30 );
	[mybutton addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:mybutton];
	mybutton1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[mybutton1 setTitle:@"move" forState:UIControlStateNormal];
	mybutton1.frame=CGRectMake(30,250 , 100, 30);
	[mybutton1 addTarget:self action:@selector(show1) forControlEvents:UIControlEventTouchUpInside ];
	[self.view addSubview:mybutton1];
	mybutton2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[mybutton2 setTitle:@"zoom" forState:UIControlStateNormal];
	mybutton2.frame=CGRectMake(30,300 , 100, 30);
	[mybutton2 addTarget:self action:@selector(show2) forControlEvents:UIControlEventTouchUpInside ];
	[self.view addSubview:mybutton2];
	
}
int i=0;
-(void)show
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:3.0];
	
	myimage.transform=CGAffineTransformMakeRotation(M_PI*0.50*i) ;
	[UIView commitAnimations];
	i++;
}
-(void)show1
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	myimage.transform=CGAffineTransformMakeTranslation(100.0, 200.0);
	
	[UIView commitAnimations];
	i++;
}
-(void)show2
{
	int i;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	myimage.transform=CGAffineTransformMakeScale(2.0, 1.5);
	
	[UIView commitAnimations];
	i++;
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
