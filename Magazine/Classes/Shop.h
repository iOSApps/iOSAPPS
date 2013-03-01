
#import <UIKit/UIKit.h>
#import "MagazineMain.h"
#import "MoreWebView.h"
@interface Shop : UIViewController<UITabBarDelegate>
{
    NSMutableArray *productName;
    
    IBOutlet UITableView *table;
    MagazineMain *a;
    MoreWebView *w;
    //Search bar in table view
   // UISearchBar *search;
    //UIBarButtonItem *searchDoneButton;
    //NSMutableArray *arrTemp;
    
    
    
}
@property(nonatomic,retain)IBOutlet UITableView *table;
@property(nonatomic,retain)NSArray *productName;
//@property(nonatomic,retain)UISearchBar *search;
//@property(nonatomic,retain)UIBarButtonItem *searchDoneButton;
//@property(nonatomic,retain)NSMutableArray *arrTemp;

@end
