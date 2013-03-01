//
//  AddRoleTVC.h
//  Staff Manager
//
//  Created by Tim Roadley on 9/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Role.h"

@class AddRoleTVC;
@protocol AddRoleTVCDelegate <NSObject>
- (void)theSaveButtonOnTheAddRoleTVCWasTapped:(AddRoleTVC *)controller;
@end

@interface AddRoleTVC : UITableViewController
@property (nonatomic, weak) id <AddRoleTVCDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *roleNameTextField;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (IBAction)save:(id)sender;

@end
