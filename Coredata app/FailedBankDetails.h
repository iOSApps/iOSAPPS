//
//  FailedBankDetails.h
//  FailedBanksCD
//
//  Created by Ray Wenderlich on 4/15/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <CoreData/CoreData.h>

@class FailedBankInfo;

@interface FailedBankDetails :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * closeDate;
@property (nonatomic, retain) NSDate * updatedDate;
@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) FailedBankInfo * info;

@end



