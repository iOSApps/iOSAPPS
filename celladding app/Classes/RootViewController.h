//
//  RootViewController.h
//  celladding
//
//  Created by suhas on 23/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	//UITableViewCell *cell;
	UITableView *table1;
	//NSMutableArray *array;
	//NSIndexPath *indexPath;
}
//@property(nonatomic,retain)UITableViewCell *cell;
@property(nonatomic,retain)UITableView *table1;
//@property(nonatomic,retain)NSMutableArray *array;
//@property(nonatomic,retain)NSIndexPath *indexPath;

@end
