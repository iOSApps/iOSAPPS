//
//  PNRStatusDetailView.h
//  IndainRailWayPNRStatus
//
//  Created by venkat on 10/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PNRStatusDetailView : UIViewController<UIAlertViewDelegate>{
	
	NSString *pinString_;
	NSDictionary *pnrData_,*statusData_,*trainNumber_,*trainName_,*pnrNumber_,*passengerData_,*seatNumber_;
	NSDictionary *seatStatus_,*trainClass_,*trainFrom_,*depatureStationCode_,*depatureStationName_,*depatureTime_;
    NSDictionary *trainTo_,*ArravialStationcode_,*ArravialStationName_,*ArravialTime_,*travelDate_,*trainDate_;
	IBOutlet UILabel *trnName_,*trnNumber_,*prNumber_;
	IBOutlet UITextField *depName_,*depCode_,*depTime_,*arrName_,*arrCode_,*arrTime_,*clss_;
	IBOutlet UITextView *trainseats_;
	UIAlertView *inValidAlert_;

}
@property (nonatomic,retain)UILabel *trnName_,*trnNumber_,*prNumber_;
@property (nonatomic,retain)UITextField *depName_,*depCode_,*depTime_,*arrName_,*arrCode_,*arrTime_,*clss_;
@property (nonatomic,retain)IBOutlet UITextView *trainseats_;
@property(nonatomic,retain)NSString *pinString_;
@end
