//
//  StudentMasterViewController.h
//  StudentManager
//
//  Created by Udaya V Nayak on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddStudentTVC.h"


@interface StudentMasterViewController : UITableViewController <AddStudentTVCDelegate>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@property (nonatomic, strong) NSArray *_studentList;

@end
