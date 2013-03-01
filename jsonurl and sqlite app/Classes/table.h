//
//  table.h
//  project
//
//  Created by arunbabu on 19/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface table : UITableViewController 
{
	NSMutableArray *arr;
	NSMutableArray *arr1;
	NSMutableArray *arr2;
	NSMutableArray *arr3;
	NSMutableArray *arr4;
	
	NSMutableString *s1;
	NSMutableString *s2;
}
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic,retain)NSMutableArray *arr1;
@property(nonatomic,retain)NSMutableArray *arr2;
@property(nonatomic,retain)NSMutableArray *arr3;
@property(nonatomic,retain)NSMutableArray *arr4;
@property(nonatomic,retain)NSMutableString *s1;
@property(nonatomic,retain)NSMutableString *s2;
@end
