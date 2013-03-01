//
//  senderViewController.h
//  sender
//
//  Created by Manjunath Reddy on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface senderViewController : UIViewController{
	UIButton *button;
	 UIButton *button1;
 UILabel *label;
	
}
@property(nonatomic,retain)IBOutlet UIButton *button;
@property(nonatomic,retain)IBOutlet UIButton *button1;
@property(nonatomic,retain)IBOutlet UILabel *label;
-(IBAction)click:(id)sender;
@end

