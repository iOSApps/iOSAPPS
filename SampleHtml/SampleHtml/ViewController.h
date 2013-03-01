//
//  ViewController.h
//  SampleHtml
//
//  Created by Guest on 21/11/12.
//  Copyright (c) 2012 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *web;
}
@property(nonatomic,strong)UIWebView *web;

@end
