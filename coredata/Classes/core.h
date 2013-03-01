//
//  core.h
//  coredata
//
//  Created by venky on 19/04/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface core : UIViewController {
	UITextField *name;
    UITextField *address;
    UITextField *phone;
    UILabel     *status;

}
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction) saveData;
- (IBAction) findContact;
- (IBAction) get;

@end
