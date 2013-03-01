//
//  Detail.h
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Map1.h"
//#import"RootViewController.h"

@interface Detail : UIViewController {
	NSMutableArray *ar3;
	IBOutlet UITextView *tv;
	NSString *strin,*strin1,*strin2,*strin0;
	
}
@property(nonatomic,retain)UITextView *tv;
@property(nonatomic,retain)NSMutableArray *ar3;
@property(nonatomic,retain) NSString *strin,*strin1,*strin2,*strin0;
//@property(nonatomic,retain)float *x1,*y1;
//-(IBAction)back:(id)sender;
-(IBAction)map:(id)sender;

@end
