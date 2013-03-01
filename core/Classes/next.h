//
//  next.h
//  manojcore
//
//  Created by manoj1 on 20/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface next : UIViewController {
	IBOutlet UITextField *salary,*emp_name,*emp_id;
	IBOutlet UILabel *status;
}
@property(nonatomic,retain)IBOutlet UITextField *salary,*emp_name,*emp_id;
@property(nonatomic,retain)IBOutlet UILabel *status;
- (IBAction) saveData;
- (IBAction) findContact;
- (IBAction) get;
@end
