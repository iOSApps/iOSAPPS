//
//  Map1.h
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<MapKit/MapKit.h>
#import<CoreLocation/CoreLocation.h>
#import"Annotation.h"
#import"Location.h"

@interface Map1 : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate> {

	MKMapView *mapview;
	NSString *map1,*map2,*map3,*map4;
	Annotation *annotation;
	Location *loc;
	double lat,lng,dir;
	CLLocationManager *locationManager;
}
@property(nonatomic,retain)NSString *map1,*map2,*map3,*map4;
-(CLLocationCoordinate2D)addressLocation;

@end
