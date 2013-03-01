//
//  OverlayViewController.h
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright 2009 Rose India. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface OverlayViewController : UIViewController 

{
RootViewController *rvController;
}

@property (nonatomic, retain) RootViewController *rvController;


@end
