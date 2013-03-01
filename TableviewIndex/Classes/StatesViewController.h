//
//  StatesViewController.h
//  IndexedTable
//
//  Created by cwiles on 2/24/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//  web: http://www.corywiles.com/
//  email: kwylez@gmail.com
//

#import <UIKit/UIKit.h>


@interface StatesViewController : UITableViewController {
  NSArray *states;
  NSMutableArray *arrayOfCharacters;
  NSMutableDictionary *objectsForCharacters;
}

@property (nonatomic, retain) NSArray *states;
@property (nonatomic, retain) NSMutableArray *arrayOfCharacters;
@property (nonatomic, retain) NSMutableDictionary *objectsForCharacters;

- (void)setupIndexData;

@end
