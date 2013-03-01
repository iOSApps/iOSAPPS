//
//  first.h
//  imageinplist
//
//  Created by sandeep on 05/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface first : UIViewController<UITextFieldDelegate>
{
	UITextField *name;
	UITextField *rollno;
	UITextField *dob;
	UILabel *l;
	UIButton *b;
}
@property(nonatomic,retain)UITextField *name;
@property(nonatomic,retain)UITextField *rollno;
@property(nonatomic,retain)UITextField *dob;
@property(nonatomic,retain)UIButton *b;
@property(nonatomic,retain)UILabel *l;
	
	
	
	



@end
