//
//  JsonurlViewController.h
//  Jsonurl
//
//  Created by aslam on 28/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Table.h"

@interface JsonurlViewController : UIViewController 
{
	NSMutableArray *jsonarray;
	NSMutableArray *array;
	//UITableView *table;
	NSDictionary *r;

}

@property (nonatomic, retain) NSMutableArray *jsonarray,*array;
//@property (nonatomic,retain) IBOutlet UITableView *table;
@property (nonatomic,retain) NSDictionary *r;
-(IBAction)click;


@end

