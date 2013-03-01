//
//  ViewController.h
//  WebViewEx
//
//  Created by Guest on 30/01/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *webView;
	UIButton *back;
	UIButton *forward;
	UIActivityIndicatorView *activityIndicator;
}

@property(nonatomic,retain)IBOutlet UIWebView *webView;
@property(nonatomic,retain)IBOutlet UIButton *back;
@property(nonatomic,retain)IBOutlet UIButton *forward;
@property(nonatomic,retain)IBOutlet UIActivityIndicatorView *activityIndicator;

-(IBAction)backButtonPressed: (id)sender;
-(IBAction)forwardButtonPressed: (id)sender;


@end
