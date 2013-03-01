
//  instawitViewController.m
//  instawit
//
//  Created by Anurag Gupta on 24/12/10.
//  Copyright 2010 iphonetut. All rights reserved.
//

#import "instawitViewController.h"

@implementation instawitViewController
@synthesize activities, feeling, txt1, pickerView ,btn;



//method to determine that how many components should be in a picker.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;//specify that there are two components in the picker view.
}




//method of the picker view to determine that how many rows in the component is there.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent :(NSInteger)component 
{ 
	if (component==0) {
		return [activities count];
	}
	
	else {
		return[feeling count];
	}

}


//to populate the row cell in the picker view.

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
		switch (component) 
	{
			case 0:
				return [activities objectAtIndex:row];
				break;
			case 1:
				return [feeling objectAtIndex:row];
				break;
	}
		return nil;
	}



//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//	[txt1 resignFirstResponder];
//}

-(IBAction)buttonPressed
{
	NSString *msg = [NSString stringWithFormat: @"I am feeling %@ for the activity %@",
					[activities objectAtIndex:[pickerView selectedRowInComponent:0]],
					[feeling objectAtIndex:[pickerView selectedRowInComponent:1]]];

	NSLog(@"%@,%@",[activities objectAtIndex:[pickerView selectedRowInComponent:0]],[feeling objectAtIndex:[pickerView selectedRowInComponent:1]]);
	txt1.text = msg;
					
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
	 [super viewDidLoad];
	activities =[[NSArray alloc] initWithObjects:@"Running",@"Crying",@"Boring",@"Working",nil];
    feeling = [[NSArray alloc] initWithObjects: @"Happy", @"Sad" , @"Good", @"joyce",nil];
}//file://localhost/Users/sandeep/Desktop/sandeeprdy/pickerview%20app/Classes

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
	[pickerView release];
	[activities release];
	[feeling release];
    [super dealloc];
}

 @end
