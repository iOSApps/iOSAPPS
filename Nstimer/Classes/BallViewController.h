//
//  BallViewController.h
//  Ball
//
//  Created by Brandon Trebitowski on 10/27/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BallViewController : UIViewController {
	IBOutlet UIImageView *ball;
	CGPoint pos;
}

@property(nonatomic,retain) IBOutlet UIImageView *ball;

@end

