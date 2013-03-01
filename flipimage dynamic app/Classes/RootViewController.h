//
//  RootViewController.h
//  fliptry
//
//  Created by anand on 22/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController 
{
	UILabel *l1,*l2,*l3,*l4,*l5,*label;
	NSMutableArray *arr;
	UITableViewCell *cell;
}
@property(nonatomic,retain)UILabel *l1,*l2,*l3,*l4,*l5,*label;
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic,retain)UITableViewCell *cell;

@end
