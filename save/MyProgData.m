//  MyProgData.m
//  007-save
#import "MyProgData.h"

@implementation MyProgData

- (id)initWithCoder:(NSCoder *)pCoder;
{
	if ((self = [super init]) == nil) {
		return self;
	} // end if	
	
	[pCoder decodeValueOfObjCType:@encode(int) at: &myNumber]; 
	
	if (myNumber) {
		myNumber++;
	} else {
		myNumber = 1;
	} // end if
	
	return self;
	
}// end initWithCoder

- (void)encodeWithCoder:(NSCoder *)pCoder;
{
	[pCoder encodeValueOfObjCType:@encode(int) at: &myNumber];
}// end encodeWithCoder

- (int) myNumber {
	return myNumber;
} // end myNumber

@end
