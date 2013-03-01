//
//  Async_LoadingViewController.h
//  Async Loading
//
//  Created by Charlie Key on 5/13/10.
//  Copyright Paranoid Ferret Productions 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Async_LoadingViewController : UIViewController {
  IBOutlet UIImageView *imageView;
}

- (void)loadImage;
- (void)displayImage:(UIImage *)image;

@end

