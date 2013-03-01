//
//  SliderAppDelegate.m
//  Slider
//
//  Created by Deepak Kumar on 21/08/09.
//  Copyright Rose India 2009. All rights reserved.
//

#import "SliderAppDelegate.h"

@implementation SliderAppDelegate

@synthesize window,labelTxt ;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

-(IBAction)changeSlider:(id)sender  
{
	labelTxt .text= [[NSString alloc] initWithFormat:@" Value %d ", (int)slider.value];
	
}




- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
