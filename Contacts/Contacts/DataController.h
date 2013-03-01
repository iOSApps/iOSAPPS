//
//  DataController.h
//  Contacts
//
//  Created by Luc Wollants on 06/04/11.
//  Copyright 2011 apptite. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Contact;

@interface DataController : NSObject {
    NSArray* contacts;
}

@property (readonly)NSArray* contacts;
-(NSArray*)filterContactsWithLastName:(NSString*)lastName;

-(void)deleteContact:(Contact*)contact;
-(void)addContact:(Contact*)contact;

+(DataController*)instance;

@end
