
#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import "MagazineMain.h"
#import "CreatingAccount.h"

@interface SingIn : UIViewController
{
IBOutlet UITextField *field1;
IBOutlet UITextField *field2;
//IBOutlet UILabel *label1;
//IBOutlet UILabel *label2;
NSString        *databasePath;

sqlite3 *contactDB;
IBOutlet UILabel *status;

}

@property(nonatomic,retain)UITextField *field1;
@property(nonatomic,retain)UITextField *field2;
@property(nonatomic,retain)UILabel *status;
@property(nonatomic,retain)NSString *databasePath;
-(IBAction)Login:(id)sender;
-(IBAction)Return:(id)sender;
-(IBAction)NewUser:(id)sender;
-(IBAction)BackButton:(id)sender;

@end
