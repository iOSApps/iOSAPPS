//
//  CurlImageViewController.h
//  CurlImage
//
//  Created by Deepak Kumar on 22/09/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurlImageViewController : UIViewController {
	UIView *containerView;
	UIImageView *mainView;
	UIImageView *curlToView;
	
}

@property (nonatomic, retain) UIView *containerView;
@property (nonatomic, retain) UIImageView *mainView;
@property (nonatomic, retain) UIImageView *curlToView;

- (IBAction)curlAction:(id)sender;

@end

