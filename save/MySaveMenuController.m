//  MySaveMenuController.m
//  007-save
#import "MySaveMenuController.h"

@implementation MySaveMenuController

- (IBAction)doTheSave:(id)pId; {	
	BOOL tvarResult	= [NSKeyedArchiver archiveRootObject:myMyProgDataObj toFile:@"../../../007_MySavedFile"];
	if (tvarResult) {
		int tvarInt = [myMyProgDataObj myNumber];
		NSLog(@"doTheSave succeded: tvarInt = %3d",tvarInt);
	} else {
		NSLog(@"doTheSave failed");
	} // end if
	
} // end doIt

- (IBAction)doTheLoad:(id)pId; {
	myMyProgDataObj = [NSKeyedUnarchiver unarchiveObjectWithFile:@"../../../007_MySavedFile"];
	if (myMyProgDataObj) {
		int tvarInt = [myMyProgDataObj myNumber];
		NSLog(@"doTheLoad succeded: tvarInt = %3d",tvarInt);
	} else {
		NSLog(@"doTheLoad failed");
		myMyProgDataObj = [[MyProgData alloc]initWithCoder:nil];
	} // end if
	
} // end doIt

@end
