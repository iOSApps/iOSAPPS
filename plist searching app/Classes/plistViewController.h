//
//  plistViewController.h
//  plist
//
//  Created by naveen on 29/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface plistViewController : UIViewController {
	IBOutlet UITextField *text1;
	IBOutlet UITextField *text2;
	IBOutlet UITextField *text3;
	IBOutlet UITextField *text4;

}
@property(nonatomic,retain)UITextField *text1;
@property(nonatomic,retain)UITextField *text2;
@property(nonatomic,retain)UITextField *text3;
@property(nonatomic,retain)UITextField *text4;
-(IBAction)ADD;
-(IBAction)clear;
-(IBAction)search;

@end

