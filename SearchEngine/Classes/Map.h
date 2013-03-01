//
//  Map.h
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<MapKit/MapKit.h>
#import<CoreLocation/CoreLocation.h>
#import"Location.h"
#import"Annotation.h"
@interface Map : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate> {
	MKMapView *mapview;
	//float *x2;
	//float *y2;
	//IBOutlet UIView *viewformap;
	NSString *map1;
	NSString *map2;
	NSString *map3;
	NSString *map4;
	Annotation *annotation;
    Location *loc;
	double lat;
	double lng;
	double dir;
	CLLocationManager *locationManager;
	
}
//@property(nonatomic,retain)CLLocationManager *lm;
//@property(nonatomic,retain)UIView *viewformap;
@property(nonatomic,retain)NSString *map1,*map2,*map3,*map4;
-(CLLocationCoordinate2D)addressLocation;
//@property(nonatomic,retain)float *x2,*y2;
//-(void)displayMYMap;

@end
