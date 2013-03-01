//
//  Button_ExampleViewController.h
//  Button_Example
//
//  Created by Chakra on 07/04/11.
//  Copyright 2011 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"


@interface Button_ExampleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

	IBOutlet UITableView *tableView;
	NSMutableArray *sections;
		
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *sections;

-(IBAction)buttonPressed:(id)sender;

@end

