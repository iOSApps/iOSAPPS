//
//  FailedBankInfo.h
//  FailedBanksCD
//
//  Created by Ray Wenderlich on 4/15/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <CoreData/CoreData.h>

@class FailedBankDetails;

@interface FailedBankInfo :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) FailedBankDetails * details;

@end



