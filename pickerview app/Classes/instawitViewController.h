//
//  instawitViewController.h
//  instawit
//
//  Created by Anurag Gupta on 24/12/10.
//  Copyright 2010 iphonetut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface instawitViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
{   IBOutlet UIPickerView *pickerView;
	IBOutlet UITextField *txt1;
	IBOutlet UIButton *btn;
	NSArray *activities;
	NSArray *feeling;
}
@property(retain,nonatomic)UITextField *txt1;
@property(retain,nonatomic)UIButton *btn;
@property(retain,nonatomic)NSArray* activities;
@property(retain, nonatomic)NSArray* feeling;
@property(retain, nonatomic)UIPickerView *pickerView;

-(IBAction)buttonPressed;
@end

