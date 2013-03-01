//
//  PreloaderViewController.h
//  Preloader
//
//  Created by NMG on 8/22/11.
//  Copyright 2011 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PreloaderViewController : UIViewController <UIWebViewDelegate, UIAlertViewDelegate, NSCacheDelegate> {
	NSString *link;
	UIAlertView *progressAlert;
	UIProgressView *progressView;
	NSMutableData *receivedData;
	UIWebView *aWebView;
	UILabel *progressLabel;
	int totalfilesize;
	int filesizereceived;
	float filepercentage;

}

@end
