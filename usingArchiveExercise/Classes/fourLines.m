//
//  fourLines.m
//  usingPlist
//
//  Created by Chakra on 15/02/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import "fourLines.h"


@implementation fourLines

@synthesize field1,field2,field3,field4,textViewField;


-(id)init{
	self = [super init];
	return self;
}


#pragma mark NSCoding

-(void)encodeWithCoder:(NSCoder *)encoder{
	
	NSLog(@"encode :%@",field1);

	
	[encoder encodeObject:field1 forKey:kField1Key];
	[encoder encodeObject:field2 forKey:kField2Key];
	[encoder encodeObject:field3 forKey:kField3Key];
	[encoder encodeObject:field4 forKey:kField4Key];
	[encoder encodeObject:textViewField forKey:kField5Key];
}

-(id) initWithCoder:(NSCoder *)decoder{

	if(self = [super init]){
		NSLog(@"decode :%@",field1);
		self.field1 = [decoder decodeObjectForKey:kField1Key];
		self.field2 = [decoder decodeObjectForKey:kField2Key];
		self.field3 = [decoder decodeObjectForKey:kField3Key];
		self.field4 = [decoder decodeObjectForKey:kField4Key];
		self.textViewField = [decoder decodeObjectForKey:kField5Key];
	}
	return self;
}


#pragma mark NSCopying

-(id)copyWithZone:(NSZone *)zone{
	
	fourLines *copy= [[[self class] allocWithZone:zone] init];
	
	field1 = [self.field1 copy];
	field2 = [self.field2 copy];
	field3 = [self.field3 copy];
	field4 = [self.field4 copy];
	textViewField = [self.textViewField copy];
	NSLog(@"copy :%@",copy.field1);
	return copy;

}

@end
