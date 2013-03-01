
#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import "SingIn.h"



@interface CreatingAccount : UIViewController<UITabBarDelegate>
{
    UITextField     *email;
    UITextField *password;
    UITextField *repassword;
    UILabel *status;
    NSString        *databasePath;
    NSString *s2;
    
    sqlite3 *contactDB;
   // BOOL checkboxSelected;
    IBOutlet UIButton *checkboxButton;
   // SingIn *a;
    BOOL checkboxSelected;
    UIButton *checkBox;
    UILabel *checkBoxLabel;
    UIAlertView *a2;
    
   
    
}
@property (retain, nonatomic) IBOutlet UITextField *email;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property (retain, nonatomic) IBOutlet UITextField *repassword;
@property (retain, nonatomic) IBOutlet UILabel *status;
@property(nonatomic,retain) UIButton *checkbox;
@property(nonatomic,retain) UILabel *checkBoxLabel;
-(IBAction)checkBoxButton:(id)sender;
- (IBAction) saveData;
//- (IBAction) findContact;
-(IBAction)Key:(id)sender;

@end
