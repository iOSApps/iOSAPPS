//
//  PNRStatusDetailView.m
//  IndainRailWayPNRStatus
//
//  Created by venkat on 10/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PNRStatusDetailView.h"
#import "JSON.h"

@implementation PNRStatusDetailView
@synthesize pinString_,trnName_,trnNumber_,prNumber_,depName_,depCode_,depTime_,arrName_,arrCode_,arrTime_,clss_;
@synthesize trainseats_;
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
    [super viewDidLoad];
	NSLog(@"%@",pinString_);
	NSString *urlstring_=[[NSString alloc]initWithFormat:@"http://pnrapi.alagu.net/api/v1.0/pnr/%@",pinString_];
	NSURL *jsonURL = [NSURL URLWithString:urlstring_];
	NSLog(@"%@",jsonURL);
	NSString *urlData_ = [[NSString alloc] initWithContentsOfURL:jsonURL];
	NSLog(@"%@",urlData_);
	pnrData_=[[urlData_ JSONValue]objectForKey:@"status"];
	NSLog(@"json %@",pnrData_);
	NSString *staString_=[[NSString alloc]initWithFormat:@"%@",pnrData_];
	if ([staString_ isEqualToString:@"TIMEOUT"]) {
	
		UIAlertView *timeOutAlert_=[[UIAlertView alloc]initWithTitle:@"PNRStatus"
													  message:@"TIMEOUT"
													 delegate:self 
											cancelButtonTitle:@"click"
											otherButtonTitles:nil];
		[timeOutAlert_ show];
		[timeOutAlert_ release];
	}
	if ([staString_ isEqualToString:@"INVALID"])
	{
		
	   inValidAlert_=[[UIAlertView alloc]initWithTitle:@"PNRStatus"
													  message:@"INVALID"
													 delegate:self 
											cancelButtonTitle:@"click"
											otherButtonTitles:nil];
		[inValidAlert_ show];
		
	}
	else{
		statusData_=[[urlData_ JSONValue]objectForKey:@"data"];
		NSLog(@"%@",statusData_);
		passengerData_=[statusData_ objectForKey:@"passenger"];
		//NSArray *passengerArray_=[NSArray arrayWithObjects:passengerData_,nil];
		int k=1;
		for (int i=0; i<[passengerData_ count]; i++) {
			seatNumber_=[[passengerData_ objectAtIndex:i]objectForKey:@"seat_number"];
			seatStatus_=[[passengerData_ objectAtIndex:i]objectForKey:@"status"];
			//trainseats_.text=seatNumber_;
			//NSLog(@"%@  %@",seatNumber_,seatStatus_);
			
		NSString *aux =[trainseats_.text stringByAppendingString:[NSString stringWithFormat:@"\n  %i) %@: %@",k,seatNumber_,seatStatus_]];
			[trainseats_ setText:aux];

			k++;
		}
		pnrNumber_=[statusData_ objectForKey:@"pnr_number"];
		trainNumber_=[statusData_ objectForKey:@"train_number"];
		trainName_=[statusData_ objectForKey:@"train_name"];
	    trainClass_=[statusData_ objectForKey:@"class"];
		prNumber_.text=[NSString stringWithFormat:@"%@",pnrNumber_];
		trnName_.text=[NSString stringWithFormat:@"%@",trainName_];
		trnNumber_.text=[NSString stringWithFormat:@"%@",trainNumber_];
		clss_.text=[NSString stringWithFormat:@"%@",trainClass_];
		//NSLog(@"pnr %@  number %@  train name %@",pnrNumber_,trainNumber_,trainName_);
	
		trainFrom_=[statusData_ objectForKey:@"from"];
		depatureStationCode_=[trainFrom_ objectForKey:@"code"];
		depatureStationName_=[trainFrom_ objectForKey:@"name"];
		depatureTime_=[trainFrom_ objectForKey:@"time"];
		trainTo_=[statusData_ objectForKey:@"to"];
		ArravialTime_=[trainTo_ objectForKey:@"time"];
		ArravialStationcode_=[trainTo_ objectForKey:@"code"];
		ArravialStationName_=[trainTo_ objectForKey:@"name"];
		depCode_.text=[NSString stringWithFormat:@"%@",depatureStationCode_];
		depName_.text=[NSString stringWithFormat:@"%@",depatureStationName_];
		depTime_.text=[NSString stringWithFormat:@"%@",depatureTime_];
		arrCode_.text=[NSString stringWithFormat:@"%@",ArravialStationcode_];
		arrName_.text=[NSString stringWithFormat:@"%@",ArravialStationName_];
		arrTime_.text=[NSString stringWithFormat:@"%@",ArravialTime_];
	
		
		
	}
	[urlstring_ release];
	[staString_ release];
	
	
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	
	if (buttonIndex=1) {
	
		[self dismissModalViewControllerAnimated:YES];
		[inValidAlert_ release];
	}
	
	
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
	[inValidAlert_ release];
}


@end
