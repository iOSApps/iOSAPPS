//
//  Annotation.m
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Annotation.h"


@implementation Annotation
@synthesize coordinate,title,subtitle;

-(id)initwithcoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subtitle:(NSString *)at
{
	coordinate=c;
	self.title=t;
	self.subtitle=at;
	
	return self;
	
}
-(NSString *)subtitle{
	return subtitle;
}
-(NSString *)title{
	return title;
}





@end
