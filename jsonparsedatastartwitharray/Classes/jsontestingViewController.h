//
//  jsontestingViewController.h
//  jsontesting
//
//  Created by srama on 28/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ta.h"
@interface jsontestingViewController : UIViewController {
	NSMutableArray *jsonArray;
	NSMutableArray *ar;
	UITableView *table;
	NSDictionary *u;
}

@property (nonatomic, retain) NSMutableArray *jsonArray,*ar;
@property (nonatomic,retain) IBOutlet UITableView *table;
@property (nonatomic,retain) NSDictionary *u;

-(IBAction)click;

@end

