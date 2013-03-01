//
//  cnuViewController.h
//  cnu
//
//  Created by sandeep on 23/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cnuViewController : UIViewController {
	IBOutlet UITextField *text1;
	IBOutlet UITextField *text2;
	IBOutlet UILabel *label;
	int x,y,result;

}
@property(nonatomic,retain)UITextField *text1;
@property(nonatomic,retain)UITextField *text2;
@property(nonatomic,retain)UILabel *label;
@property(nonatomic,readwrite)int x;
@property(nonatomic,readwrite)int y;
-(IBAction)add;
-(IBAction)sub;
-(IBAction)mul;
-(IBAction)div;
-(IBAction)done;

@end

