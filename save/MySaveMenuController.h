//  MySaveMenuController.h
//  007-save
#import <Cocoa/Cocoa.h>
#import "MyProgData.h"

@interface  MySaveMenuController : NSMenu {
	MyProgData * myMyProgDataObj;
}
- (IBAction)doTheSave:(id)pId;
- (IBAction)doTheLoad:(id)pId;

@end
