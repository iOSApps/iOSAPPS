//
//  PersonRoleTVC.h
//  Staff Manager
//
//  Created by Tim Roadley on 19/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Role.h"
#import "CoreDataTableViewController.h" // so we can fetch

@class PersonRoleTVC;
@protocol PersonRoleTVCDelegate
- (void)roleWasSelectedOnPersonRoleTVC:(PersonRoleTVC *)controller;
@end

@interface PersonRoleTVC : CoreDataTableViewController
@property (nonatomic, weak) id  delegate;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Role *selectedRole;

@end
