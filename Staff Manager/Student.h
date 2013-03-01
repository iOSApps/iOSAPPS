//
//  Student.h
//  StudentManager
//
//  Created by Soma Saha on 06/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * student_course;
@property (nonatomic, retain) NSString * student_dob;
@property (nonatomic, retain) NSString * student_email;
@property (nonatomic, retain) NSString * student_fname;
@property (nonatomic, retain) NSString * student_lname;
@property (nonatomic, retain) NSString * student_notes;
@property (nonatomic,retain)  NSString * student_phone;
 
@end
