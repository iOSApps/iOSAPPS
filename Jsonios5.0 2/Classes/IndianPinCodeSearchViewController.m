//
//  IndianPinCodeSearchViewController.m
//  IndianPinCodeSearch
//
//  Created by Manjunath Reddy on 13/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IndianPinCodeSearchViewController.h"
#import "JSON.h"
@implementation IndianPinCodeSearchViewController

@synthesize resultLabel_,searchTextField_,i1;


- (IBAction)textFieldShouldReturn:(UITextField *)theTextField
{
	 [theTextField resignFirstResponder];
	

}
	-(IBAction)searchButtonClick:(id)sender
{

	NSString *urlstring=[[NSString alloc]initWithFormat:@"http://www.getpincode.info/api/pincode?q=%@",searchTextField_.text];
	NSURL *pinCodeURL_= [NSURL URLWithString:urlstring];
	NSLog(@"%@",pinCodeURL_);
	//NSString *pinCodeData_=[[NSString alloc]initWithContentsOfURL:pinCodeURL_];
    
    NSData *data=[NSData dataWithContentsOfURL:pinCodeURL_];
	NSLog(@"%@",data);
    NSError *error;
    city_=[NSJSONSerialization 
            JSONObjectWithData:data
            
            options:kNilOptions error:&error];
    NSLog(@"city is %@",city_);
    c=[city_ objectForKey:@"query"];
	//city_=[[pinCodeData_ JSONValue]objectForKey:@"query"];
   //pincode_ =[[pinCodeData_ JSONValue]objectForKey:@"pincode"];
    NSLog(@"query is %@",c);
    pincode_=[city_ objectForKey:@"pincode"];
	NSString *resultString_=[[NSString alloc]initWithFormat:@"%@\tpin\t is %@",city_,pincode_];
	
	resultLabel_.text=resultString_;
	[urlstring release];
	[data release];
	[resultString_ release];


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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[city_ release];
	[pincode_ release];
    [super viewDidLoad];
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
