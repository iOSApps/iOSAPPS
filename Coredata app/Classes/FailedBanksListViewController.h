//
//  FailedBanksListViewController.h
//  FailedBanksCD
//
//  Created by Ray Wenderlich on 4/15/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailedBanksListViewController : UITableViewController {
    NSArray *_failedBankInfos;
    NSManagedObjectContext *_context;    
}

@property (nonatomic, retain) NSArray *failedBankInfos;
@property (nonatomic, retain) NSManagedObjectContext *context;

@end
