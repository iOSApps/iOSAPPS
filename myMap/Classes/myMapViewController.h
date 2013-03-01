//
//  myMapViewController.h
//  myMap
//
//  Created by Neelam Roy on 8/6/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface myMapViewController : UIViewController <MKMapViewDelegate> {
	
IBOutlet MKMapView* myMapView;

}

@property (nonatomic, retain) IBOutlet MKMapView* myMapView;

-(void)displayMYMap;

@end

