//
//  Role.h
//  Staff Manager
//
//  Created by Tim Roadley on 17/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Role : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *heldBy;
@end

@interface Role (CoreDataGeneratedAccessors)

- (void)addHeldByObject:(Person *)value;
- (void)removeHeldByObject:(Person *)value;
- (void)addHeldBy:(NSSet *)values;
- (void)removeHeldBy:(NSSet *)values;

@end
