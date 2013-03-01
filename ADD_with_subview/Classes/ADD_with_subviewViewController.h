//
//  ADD_with_subviewViewController.h
//  ADD_with_subview
//
//  Created by saurabhkumar on 27/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADD_with_subviewViewController : UIViewController {

	
	IBOutlet UITextField *t1;
	IBOutlet UITextField *t2;
	IBOutlet UITextField *t3;

	
}

@property(nonatomic,retain)UITextField *t1;
@property(nonatomic,retain)UITextField *t2;
@property(nonatomic,retain)UITextField *t3;

-(IBAction)add;

@end

