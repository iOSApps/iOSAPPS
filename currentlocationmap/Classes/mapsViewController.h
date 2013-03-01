//
//  mapsViewController.h
//  maps
//
//  Created by vanita on 23/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface mapsViewController : UIViewController<MKMapViewDelegate>
{
	IBOutlet MKMapView *mapview;
	IBOutlet UIToolbar *toolBar;

}
@property(nonatomic,retain)IBOutlet MKMapView *mapview;
@property(nonatomic,retain)IBOutlet UIToolbar *toolBar;
@end

