//
//  imagedraginingViewController.m
//  imagedragining
//
//  Created by sandeep on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "imagedraginingViewController.h"

@implementation imagedraginingViewController
@synthesize myimage;
@synthesize myimage1;



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
	
	//myimage=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 20, 20)];
	//myimage.image=[UIImage imageNamed:@"a3.png"];
	
	
	NSArray *k=[NSArray arrayWithObjects:
				[UIImage imageNamed:@"7.png"],
				[UIImage imageNamed:@"index.png"],
				[UIImage imageNamed:@"cutefriendship11.jpg"],nil];
	
	myimage=[[UIImageView alloc]initWithFrame:CGRectMake(30, 290, 280, 100)];
	myimage.image=[UIImage imageNamed:@"d7.png"];
	myimage.backgroundColor=[UIColor redColor];
	myimage.animationImages=k;
	myimage.animationDuration=1.0;
	myimage.contentMode=UIViewContentModeBottom;
	[self.view addSubview:myimage];
	//[myimage1 release];
	//[k release];
}
	
				
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"in touch began x=%f,y=%f",[[touches anyObject]locationInView:self.view].x,[[touches anyObject]locationInView:self.view].y);
	[myimage startAnimating];
	
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"in touch moved x=%f,y=%f",[[touches anyObject]locationInView:self.view].x,[[touches anyObject]locationInView:self.view].y);
[myimage stopAnimating];
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
