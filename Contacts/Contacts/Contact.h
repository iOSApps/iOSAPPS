//
//  Contact.h
//  Contacts
//
//  Created by Luc Wollants on 06/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject {
    NSString* firstName;
    NSString* lastName;
    NSDate* birthDate;
}

@property (retain, nonatomic) NSString* firstName;
@property (retain, nonatomic) NSString* lastName;
@property (retain, nonatomic) NSDate* birthDate;

-(id)initWithFirstName:(NSString*)aFirstName andLastName:(NSString*)aLastName andBirthDate:(NSDate*)aBirthDate;

@end
