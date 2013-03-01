//
//  Person.h
//  Staff Manager
//
//  Created by Tim Roadley on 17/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Role;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * dob;
@property (nonatomic, retain) NSString * contact;
@property (nonatomic, retain) NSString * course;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) Role *inRole;

@end
