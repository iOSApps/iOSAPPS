//
//  saveViewController.h
//  save
//
//  Created by sandeep on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface saveViewController : UIViewController {
	UITextField *t1;

}
@property(nonatomic,retain)IBOutlet UITextField *t1;
-(IBAction)save;

@end

