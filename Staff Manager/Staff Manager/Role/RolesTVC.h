//
//  RolesTVC.h
//  Staff Manager
//
//  Created by Tim Roadley on 9/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddRoleTVC.h" // so this class can be an AddRoleTVCDelegate
#import "RoleDetailTVC.h" // so this class can be an RoleDetailTVCDelegate
#import "CoreDataTableViewController.h" // so we can fetch
#import "Role.h"
@interface RolesTVC : CoreDataTableViewController <AddRoleTVCDelegate, RoleDetailTVCDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Role *selectedRole;

@end




