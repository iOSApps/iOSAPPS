//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by Adeem on 17/05/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCellView.h"

@interface SimpleTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	IBOutlet UITableView *tblSimpleTable;
	NSArray *arryData;
	IBOutlet TableCellView *tblCell;
}

@end

