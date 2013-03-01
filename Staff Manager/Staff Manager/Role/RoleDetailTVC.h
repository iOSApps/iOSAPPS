//
//  RoleDetailTVC.h
//  Staff Manager
//
//  Created by Tim Roadley on 14/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Role.h"

@class RoleDetailTVC;
@protocol RoleDetailTVCDelegate <NSObject>
- (void)theSaveButtonOnTheRoleDetailTVCWasTapped:(RoleDetailTVC *)controller;
@end

@interface RoleDetailTVC : UITableViewController
@property (nonatomic, weak) id <RoleDetailTVCDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *roleNameTextField;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Role *role;
- (IBAction)save:(id)sender;

@end