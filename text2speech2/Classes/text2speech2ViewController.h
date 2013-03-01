//
//  text2speech2ViewController.h
//  text2speech2
//
//  Created by Snow Leopard User on 03/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface text2speech2ViewController : UIViewController {
	IBOutlet UITextView *t1;
	NSString *str1;
	
}
@property(nonatomic,retain)UITextView *t1;
@property(nonatomic,retain)NSString *str1;
-(IBAction)choose;

@end
