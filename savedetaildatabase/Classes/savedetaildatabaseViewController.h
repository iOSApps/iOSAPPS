//
//  savedetaildatabaseViewController.h
//  savedetaildatabase
//
//  Created by rajan on 9/14/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface savedetaildatabaseViewController : UIViewController {
	sqlite3 *contactDB;
	UITextField *username;
	UITextField *email_id;
	UITextField *password;
	UITextField *zipcode;
	UILabel *status;
	NSString *databasePath;
}
@property(nonatomic,retain) IBOutlet UITextField *username;
@property(nonatomic,retain) IBOutlet UITextField *email_id;
@property(nonatomic,retain) IBOutlet UITextField *password;
@property(nonatomic,retain) IBOutlet UITextField *zipcode;
@property(nonatomic,retain) IBOutlet UILabel *status;

-(IBAction)saveData;
-(IBAction)findContact;
-(IBAction)textfieldshouldreturn:(id)sender;
@end

