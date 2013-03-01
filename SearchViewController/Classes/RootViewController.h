//
//  RootViewController.h
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OverlayViewController;

@interface RootViewController : UITableViewController 
{
	NSMutableArray *Items;
	NSMutableArray *copyListOfItems;
	IBOutlet UISearchBar *searchBar;
	BOOL searching;
	BOOL letUserSelectRow;

	OverlayViewController *ovController;
}
- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
