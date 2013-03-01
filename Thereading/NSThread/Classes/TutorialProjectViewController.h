//
//  TutorialProjectViewController.h
//  TutorialProject
//
//  Created by Ondrej Rafaj on 5.8.09.
//  Copyright Home 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialProjectViewController : UIViewController {
	
	// ------ Tutorial code starts here ------
	
	// Thread part
	IBOutlet UILabel *threadValueLabel;
	IBOutlet UIProgressView *threadProgressView;
	IBOutlet UIButton *threadStartButton;
	
	// Test part
	IBOutlet UILabel *testValueLabel;
	
	// ------ Tutorial code ends here ------
	
}

// ------ Tutorial code starts here ------

@property (nonatomic, retain) IBOutlet UILabel *threadValueLabel;
@property (nonatomic, retain) IBOutlet UIProgressView *threadProgressView;
@property (nonatomic, retain) IBOutlet UIButton *threadStartButton;

@property (nonatomic, retain) IBOutlet UILabel *testValueLabel;


- (IBAction) startThreadButtonPressed:(UIButton *)sender;

- (IBAction) testValueSliderChanged:(UISlider *)sender;

// ------ Tutorial code ends here ------

// This function is for button which takes you to the xprogress.com website
- (IBAction) runXprogressComButton: (id) sender;

@end

