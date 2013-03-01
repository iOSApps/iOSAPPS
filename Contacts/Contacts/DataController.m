//
//  DataController.m
//  Contacts
//
//  Created by Luc Wollants on 06/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import "DataController.h"
#import "Contact.h"

@implementation DataController

@synthesize contacts;

+(DataController*)instance
{
    static DataController* instance = nil;
    if (!instance)
    {
        instance = [[DataController alloc]init];
    }
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {      
        NSDate *birthDate1 = [[NSDate alloc]initWithString:@"1955-02-24 00:00:00 +0000"];
        Contact *contact1 = [[Contact alloc]initWithFirstName:@"Steve"
                                                  andLastName:@"Gates"
                                                 andBirthDate:birthDate1];
        
        NSDate *birthDate2 = [[NSDate alloc]initWithString:@"1955-10-28 00:00:00 +0000"];
        Contact *contact2 = [[Contact alloc]initWithFirstName:@"Bill"
                                                  andLastName:@"Jobs"
                                                 andBirthDate:birthDate2];
        
        contacts = [[NSArray alloc]initWithObjects:contact1, contact2, nil];
        
        [birthDate1 release];
        [contact1 release];
        [birthDate2 release];
        [contact2 release];       
    }
    return self;
}

- (void)dealloc {
    [contacts release];
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"DataController: contacts=%@", self.contacts];;
}

-(NSArray*)filterContactsWithLastName:(NSString*)lastName
{
    if (lastName && [lastName length] > 0)
    {
        NSMutableArray *filterContacts = [[[NSMutableArray alloc]initWithArray:contacts]autorelease];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lastName LIKE %@", lastName];  
        [filterContacts filterUsingPredicate:predicate];
        return filterContacts;
    }
    else
    {
        return contacts;
    }
}

-(void)deleteContact:(Contact*)contact
{
    NSMutableArray *filterContacts = [[[NSMutableArray alloc]initWithArray:contacts]autorelease];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT lastName LIKE %@ AND NOT firstName LIKE %@", contact.lastName, contact.firstName];  
    [filterContacts filterUsingPredicate:predicate];
    [contacts release];
    contacts = [[NSArray alloc]initWithArray:filterContacts];
}

-(void)addContact:(Contact*)contact
{
    NSMutableArray *newContacts = [[[NSMutableArray alloc]initWithArray:contacts]autorelease];
    [newContacts addObject:contact];
    [contacts release];
    contacts = [[NSArray alloc]initWithArray:newContacts];
}

@end
