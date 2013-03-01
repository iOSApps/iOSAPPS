//
//  scroolviewViewController.h
//  scroolview
//
//  Created by sandeep on 31/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scroolviewViewController : UIViewController {
	
	IBOutlet UIScrollView *a;
	
	NSMutableArray *arr;
	NSMutableArray *arr1;
	NSArray *arr2;
	NSMutableArray *arr3;
	

	NSArray *myArray;
	NSArray *firstArray;
}

@property (nonatomic, retain) NSArray *myArray;

- (void)someMethod;

@property(nonatomic,retain)UIScrollView *a;
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic,retain)NSMutableArray *arr1;

@end

