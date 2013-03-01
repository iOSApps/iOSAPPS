//  MyProgData.h
//  007-save
#import <Cocoa/Cocoa.h>

@interface MyProgData : NSObject  <NSCoding> {
	int myNumber;
}
- (id)initWithCoder:(NSCoder *)pCoder;
- (void)encodeWithCoder:(NSCoder *)pCoder;

- (int) myNumber;

@end
