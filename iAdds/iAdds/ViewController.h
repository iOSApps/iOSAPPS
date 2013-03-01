//
//  ViewController.h
//  iAdds
//
//  Created by Guest on 15/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/iAd.h"
#import "GADBannerView.h"

@interface ViewController : UIViewController<ADBannerViewDelegate, GADBannerViewDelegate>;

@property (nonatomic, strong) ADBannerView *bannerView;
@property (nonatomic, strong) GADBannerView *admobBannerView;

@end



