//
//  ViewController.h
//  Facebook
//
//  Created by Guest on 08/02/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBFeedPost.h"

@interface ViewController : UIViewController<FBFeedPostDelegate>  {
	IBOutlet UITextField *txtLink;
	IBOutlet UITextView *txtCaption;
}

@property (nonatomic, retain) IBOutlet UITextField *txtLink;
@property (nonatomic, retain) IBOutlet UITextView *txtCaption;

- (IBAction) btnPostPress:(id) sender;


@end
