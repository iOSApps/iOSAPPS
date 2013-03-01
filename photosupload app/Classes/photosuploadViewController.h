//
//  photosuploadViewController.h
//  photosupload
//
//  Created by sandeep on 04/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface photosuploadViewController : UIViewController <UIWebViewDelegate,UIActionSheetDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
	
	
	UIAlertView *al;
	UIActionSheet *as;
	UIActivityIndicatorView *ai;
	UIWebView *wb;
	UIImageView *iv;
	UIButton *b;
	
}
@property(nonatomic,retain)UIAlertView *al;
@property(nonatomic,retain)UIActionSheet *as;
@property(nonatomic,retain)UIActivityIndicatorView *ai;
@property(nonatomic,retain)UIWebView *wb;
@property(nonatomic,retain)UIImageView *iv;
@property(nonatomic,retain)UIButton *b;
@end



