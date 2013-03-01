//
//  newViewController.h
//  new
//
//  Created by sandeep on 29/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *a1;
	UINavigationBar *navBar;
	NSMutableArray *a;
	

}
@property(nonatomic,retain)NSMutableArray *a;
@property(nonatomic,retain)UINavigationBar *navBar;

@end

