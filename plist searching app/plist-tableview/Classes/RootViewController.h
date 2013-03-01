//
//  RootViewController.h
//  plist
//
//  Created by sandeep on 13/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSMutableArray *items;
}
@property(nonatomic,retain)NSMutableArray *items;
@end
