//
//  Contact.m
//  Contacts
//
//  Created by Luc Wollants on 06/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize firstName;
@synthesize lastName;
@synthesize birthDate;

-(id)initWithFirstName:(NSString*)aFirstName andLastName:(NSString*)aLastName andBirthDate:(NSDate*)aBirthDate
{
    self = [super init];
    if (self) {
        self.firstName = aFirstName;
        self.lastName = aLastName;
        self.birthDate = aBirthDate;
    }
    return self;    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Contact: firstName=%@ lastName=%@ birthDate=%@", self.firstName, self.lastName, self.birthDate];
}

@end
