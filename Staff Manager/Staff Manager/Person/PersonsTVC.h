//
//  PersonsTVC.h
//  Staff Manager
//
//  Created by Tim Roadley on 9/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPersonTVC.h" // so this class can be an AddPersonTVCDelegate
#import "PersonDetailTVC.h" // so this class can be an PersonDetailTVCDelegate
#import "CoreDataTableViewController.h" // so we can fetch
#import "Person.h"
@interface PersonsTVC : CoreDataTableViewController <AddPersonTVCDelegate, PersonDetailTVCDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Person *selectedPerson;

@end




