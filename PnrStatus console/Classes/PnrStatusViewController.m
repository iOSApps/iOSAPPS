//
//  PnrStatusViewController.m
//  PnrStatus
//
//  Created by venkat on 05/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PnrStatusViewController.h"
#import "JSON.h"
@implementation PnrStatusViewController



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
	
	NSURL *jsonURL = [NSURL URLWithString:@"http://pnrapi.alagu.net/api/v1.0/pnr/4338961828"];
	NSLog(@"%@",jsonURL);
	NSString *jsonData = [[NSString alloc] initWithContentsOfURL:jsonURL];
	NSLog(@"%@",jsonData);
	NSDictionary *datadictionary=[[jsonData JSONValue]objectForKey:@"status"];
	NSLog(@"json %@",datadictionary);
	NSDictionary *dic=[[NSDictionary alloc]init];//[datadictionary objectForKey:@"updatedFeed"]];
	
	dic=[[jsonData JSONValue] objectForKey:@"data"];
	NSDictionary *diccc=[[NSDictionary alloc]init];
	//NSLog(@"%@",dic);
	diccc=[dic objectForKey:@"passenger"];
	NSLog(@"%@",diccc);
	for (int i=0; i<[diccc count];i++) {
		NSDictionary *_seatnumber=[[NSDictionary alloc]init];
		NSDictionary *_seatstatus=[[NSDictionary alloc]init];		
		_seatnumber=[[diccc objectAtIndex:i]objectForKey:@"seat_number"];
		_seatstatus=[[diccc objectAtIndex:i]objectForKey:@"status"];
		NSLog(@"seat nember %@  status  %@",_seatnumber,_seatstatus);
	}
	
	NSDictionary *_from=[[NSDictionary alloc]init];
	_from=[dic objectForKey:@"from"];
	NSDictionary *_code=[[NSDictionary alloc]init];
	_code=[_from objectForKey:@"code"];
	
	NSDictionary *_name=[[NSDictionary alloc]init];
	_name=[_from objectForKey:@"name"];
	NSDictionary *_time=[[NSDictionary alloc]init];
	_time=[_from objectForKey:@"time"];
	
	NSLog(@" code%@ name %@  time %@ ",_code,_name,_time);
	NSDictionary *_pnrnumber=[[NSDictionary alloc]init];
	_pnrnumber=[dic objectForKey:@"pnr_number"];
	NSDictionary *_trainnumber=[[NSDictionary alloc]init];
	_trainnumber=[dic objectForKey:@"train_number"];
	NSDictionary *_trainname=[[NSDictionary alloc]init];
	_trainname=[dic objectForKey:@"train_name"];
	NSLog(@"pnrnumber %@  trainnum %@ trainname %@",_pnrnumber,_trainnumber,_trainname);
	NSDictionary *_taveldate=[[NSDictionary alloc]init];
	_taveldate=[dic objectForKey:@"travel_date"];
	
	NSDictionary *_date=[[NSDictionary alloc]init];
	_date=[_taveldate objectForKey:@"date"];
	NSDictionary *_class=[[NSDictionary alloc]init];
	_class=[dic  objectForKey:@"class"];
	NSLog(@"trvel date %@  class %@",_date,_class);
	NSDictionary *_to=[[NSDictionary alloc]init];
	_to=[dic objectForKey:@"to"];
	NSDictionary *_toname=[[NSDictionary alloc]init];
	_toname=[_to objectForKey:@"name"];
	NSDictionary *_tocode=[[NSDictionary alloc]init];
	_tocode=[_to objectForKey:@"code"];
	NSDictionary *_totime=[[NSDictionary alloc]init];
	_totime=[_to objectForKey:@"time"];
	NSLog(@"to %@ code %@ time %@",_toname,_tocode,_totime);
	
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
