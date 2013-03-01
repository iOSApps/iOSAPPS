//
//  SliderAppDelegate.h
//  Slider
//
//  Created by Deepak Kumar on 21/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderAppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
	IBOutlet UISlider *slider;
	IBOutlet UILabel *labelTxt;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UILabel *labelTxt;
-(IBAction)changeSlider:(id)sender   ;

@end

