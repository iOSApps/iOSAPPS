//
//  scroolviewViewController.m
//  scroolview
//
//  Created by sandeep on 31/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "scroolviewViewController.h"

@implementation scroolviewViewController
@synthesize a,arr,arr1,myArray;// this line adds two methods: "myArray" and "setMyArray:"




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
	
	a.contentSize=CGSizeMake(320, 640);
	a.contentInset=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
	 a.scrollIndicatorInsets=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
	/*arr=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",nil];
	arr2=[arr copy];
	arr3=[arr retain];
	
	NSLog(@"arr is %@",arr);
	NSLog(@"copy is %@",arr2);
	NSLog(@"retain is %@",arr3);
	
	
	[arr addObject:@"4"];
	NSLog(@"arr is %@",arr);
	NSLog(@"copy is %@",arr2);
	NSLog(@"retain is %@",arr3);
	
	[arr3 addObject:@"5"];
	NSLog(@"arr is %@",arr);
	NSLog(@"copy is %@",arr2);
	NSLog(@"retain is %@",arr3);*/
	/*NSArray *numberArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:45], [NSNumber numberWithInt:10], nil];
    NSInteger highestNumber;
    NSInteger numberIndex;
    for (NSNumber *theNumber in numberArray)
    {
        if ([theNumber integerValue] > highestNumber) {
			highestNumber = [theNumber integerValue];
			numberIndex = [numberArray indexOfObject:theNumber];
        }
    }
    NSLog(@"Highest number: %d at index: %d", highestNumber, numberIndex);*/
   firstArray = [NSArray arrayWithObject:@"test1"];
	
	// autoreleased
	self.myArray = firstArray; // it is ok. this new array will be 
	// retained in property's implementation of setMyArray
	NSLog(@"self is %@",self.myArray);
	
	
	NSArray *secondArray = [NSArray arrayWithObject:@"test2"]; // autoreleased
	arr2 = secondArray; // memory leak here!!!! because previous value of myArray
	// wasn't released and new value not retained. it means
	// that when run loop finished you will lose your array
	
	NSLog(@"without self is %@",arr2);
	
	NSArray *secondArray1 = [NSArray arrayWithObject:@"test3"]; // autoreleased
	arr2 = secondArray1;
	NSLog(@"without self is %@",arr2);

	
}
	- (void)someMethod {
		
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
	[arr release];
}

@end
