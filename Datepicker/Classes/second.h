//
//  second.h
//  flip
//
//  Created by flab on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface second : UIViewController< UITextFieldDelegate>{
	IBOutlet UITextField *t1;
	IBOutlet UITextField *t2;
	IBOutlet UILabel *l1;
	IBOutlet UILabel *l2;

}
-(IBAction)save1:(id)sender;


@end
