//
//  usingPlistViewController.h
//  usingPlist
//
//  Created by Chakral on 13/02/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextViewController.h"

#define kFileName @"newDocumentData"
#define fDataKey @"Data"

@interface usingPlistViewController : UIViewController<UITextViewDelegate> {
	
	
	IBOutlet UITextField *text1;
	IBOutlet UITextField *text2;
	IBOutlet UITextField *text3;
	IBOutlet UITextField *text4;
	UINavigationController *navController;
	
	


}
@property(nonatomic,retain) IBOutlet UITextField *text1;
@property(nonatomic,retain) IBOutlet UITextField *text2;
@property(nonatomic,retain) IBOutlet UITextField *text3;
@property(nonatomic,retain) IBOutlet UITextField *text4;
@property(nonatomic,retain) IBOutlet UITextView *textView;


-(NSString *) dataFilePath;
-(void) handleNotification : (NSNotification *)notify;

- (IBAction) updateText:(id) sender;
@end

