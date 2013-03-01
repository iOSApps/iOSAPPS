//
//  Annotation.h
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation> {
	
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
	
}
@property(nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property(nonatomic,retain)NSString *title,*subtitle;
-(id)initwithcoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subtitle:(NSString *)at;
-(NSString *)title;
-(NSString *)subtitle;



@end
