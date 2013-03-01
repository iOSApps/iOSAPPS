//
//  flipViewController.h
//  flip
//
//  Created by flab on 10/18/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface flipViewController : UIViewController {
	IBOutlet UIDatePicker *date;

}
@property(nonatomic,retain)UIDatePicker *date;
-(IBAction)save:(id)sender;
@end

