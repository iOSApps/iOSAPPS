//
//  IndainRailWayPNRStatusViewController.h
//  IndainRailWayPNRStatus
//
//  Created by venkat on 10/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNRStatusDetailView.h"
@interface IndainRailWayPNRStatusViewController : UIViewController {
	
	IBOutlet UITextField *pnrTextField_;
	NSString *pnrNumberString_;
}
@property(nonatomic,retain) IBOutlet UITextField *pnrTextField_;
@property(nonatomic,retain) NSString *pnrNumberString_;
-(IBAction)statusButtonClick:(id)sender;
@end

