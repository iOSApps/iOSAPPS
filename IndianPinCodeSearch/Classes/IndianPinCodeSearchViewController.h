//
//  IndianPinCodeSearchViewController.h
//  IndianPinCodeSearch
//
//  Created by Manjunath Reddy on 13/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndianPinCodeSearchViewController : UIViewController {

	IBOutlet UITextField *searchTextField_;
	IBOutlet UILabel *resultLabel_;
	NSDictionary *city_;
	NSDictionary *pincode_;
	IBOutlet UIImage *i1;
	
}
@property(nonatomic,retain)IBOutlet UITextField *searchTextField_;
@property(nonatomic,retain)IBOutlet UILabel *resultLabel_;
@property(nonatomic,retain)IBOutlet UIImage *i1;
-(IBAction)searchButtonClick:(id)sender;
- (IBAction)textFieldShouldReturn:(UITextField *)theTextField;
@end

