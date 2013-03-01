//
//  Location.m
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Location.h"


@implementation Location
@synthesize coordinate1,title1,subtitle1;

-(id)initwithcoordinate:(CLLocationCoordinate2D)c1 title1:(NSString *)t1 subtitle1:(NSString *)st1
{
	coordinate1=c1;
	self.title1=t1;
	self.subtitle1=st1;
	
	return self;
	
}
-(NSString *)subtitle1{
	return subtitle1;
}
-(NSString *)title1{
	return title1;
}

@end
