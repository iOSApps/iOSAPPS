
#import <UIKit/UIKit.h>
#import "CreatingAccount.h"
#import "SingIn.h"
#import "MagazineViewController.h"
#import "Shop.h"


//static NSString *CellIdentifier = @"Cell";
@interface MoreDetails : UIViewController
<UITableViewDelegate, UITableViewDataSource,UITabBarDelegate>
{
    IBOutlet UITableView *table;
    NSArray *productName;
   CreatingAccount *c ;
   SingIn *a;
    Shop *b1;
    UIAlertView *al;
    NSString *string2;
    
    //today code
    
    //UITableViewCell *cell;

    //IBOutlet UINavigationItem *b;
}
@property(nonatomic,retain)UITableView *table;
@property(nonatomic,retain)NSArray *productName;
@property(nonatomic,retain)CreatingAccount *c;
@property(nonatomic,retain)SingIn *a;
//@property(nonatomic,retain)Ipod *b;
-(IBAction)BackItem:(id)sender;


@end
