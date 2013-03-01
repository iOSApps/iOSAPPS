//
//  RootViewController.h
//  sample
//
//  Created by Snow Leopard User on 06/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Types.h"

@interface RootViewController : UIViewController {
	//IBOutlet UIView *displaySplash;
	IBOutlet UITextField *t1,*t2,*t3;
	NSString *str11,*str12,*str13;
	//IBOutlet UIImageView *aview;
	
	
}
@property(nonatomic,retain)UITextField *t1,*t2,*t3;
@property(nonatomic,retain)NSString *str11,*str12,*str13;
-(IBAction)go:(id)sender;
//-(void)displayScreen;	
//-(void)removeScreen;
-(IBAction)abdu:(id)sender;



@end
