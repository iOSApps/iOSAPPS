//
//  Location.h
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<MapKit/MapKit.h>

@interface Location : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate1;
	NSString *title1,*subtitle1;
	
}
@property(nonatomic,readonly)CLLocationCoordinate2D coordinate1;
@property(nonatomic,retain)NSString *title1,*subtitle1;
-(id)initwithcoordinate:(CLLocationCoordinate2D)c1 title1:(NSString *)t1 subtitle1:(NSString *)st1;
//-(void)moveannotation:(CLLocationCoordinate2D)newcoordinate;
-(NSString *)subtitle1;
-(NSString *)title1;



@end
