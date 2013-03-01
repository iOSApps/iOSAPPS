//
//  nsdateViewController.h
//  nsdate
//
//  Created by sandeep on 13/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nsdateViewController : UIViewController {
	NSDate *today;
	IBOutlet UILabel *l;

}
-(IBAction)print;

@end

