#import <UIKit/UIKit.h>

@interface CheckboxViewController : UIViewController {
	BOOL checkboxSelected;
	IBOutlet UIButton *checkboxButton;
	
}

- (IBAction)checkboxButton:(id)sender;

@end

