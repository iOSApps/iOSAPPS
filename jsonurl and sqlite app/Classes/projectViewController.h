//
//  projectViewController.h
//  project
//
//  Created by arunbabu on 19/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "JSON.h"
#import "table.h"

@interface projectViewController : UIViewController 
{
	NSMutableArray *t;
	NSMutableArray *t1;
	NSMutableArray *t2;
	NSMutableArray *t3;
	NSMutableArray *t4;
	sqlite3 *contactDB;
	NSString *databasepath;
	IBOutlet UILabel *lh;
	

}
@property (nonatomic,retain)NSMutableArray *t;
@property (nonatomic,retain)NSMutableArray *t1;
@property (nonatomic,retain)NSMutableArray *t2;
@property (nonatomic,retain)NSMutableArray *t3;
@property (nonatomic,retain)NSMutableArray *t4;
@property(nonatomic,retain)IBOutlet UILabel *lh;

-(IBAction)show;
-(IBAction)search;
-(IBAction)insert;
@end

