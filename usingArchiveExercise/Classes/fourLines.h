//
//  fourLines.h
//  usingPlist
//
//  Created by Chakra on 15/02/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kField1Key @"Field1"
#define kField2Key @"Field2"
#define kField3Key @"Field3"
#define kField4Key @"Field4"
#define kField5Key @"Field5"


@interface fourLines : NSObject <NSCoding,NSCopying>{

	NSString *field1;
	NSString *field2;
	NSString *field3;
	NSString *field4;
	NSString *textViewField;
	
}
@property(nonatomic,retain)NSString *field1;
@property(nonatomic,retain)NSString *field2;
@property(nonatomic,retain)NSString *field3;
@property(nonatomic,retain)NSString *field4;
@property(nonatomic,retain)NSString *textViewField;

@end
