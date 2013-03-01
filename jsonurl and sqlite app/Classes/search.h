//
//  search.h
//  project
//
//  Created by arunbabu on 20/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface search : UIViewController {
	sqlite3 *contactDB;
	NSString *databasePath;	
	IBOutlet UITextField *trainnumber;
	IBOutlet UILabel *arrivaltext;
	IBOutlet UILabel *departuretext;
	IBOutlet UILabel *traintext;
	IBOutlet UILabel *waitingtext;
	IBOutlet UILabel *status;
	
}
@property (nonatomic, retain) IBOutlet UITextField *trainnumber;
@property (nonatomic, retain) IBOutlet UILabel *arrivaltext;
@property (nonatomic, retain) IBOutlet UILabel *departuretext;
@property (nonatomic, retain) IBOutlet UILabel *traintext;
@property (nonatomic, retain) IBOutlet UILabel *waitingtext;
@property (nonatomic, retain) IBOutlet UILabel *status;
- (IBAction)textFieldShouldReturn:(UITextField *)textField;

-(IBAction)findtrain;

@end
