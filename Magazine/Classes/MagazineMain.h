

#import <UIKit/UIKit.h>
#import "ApplicationCell.h"
#import "MagazineBuy.h"
#import "MoreWebView.h"
//#include "Shop.h"

@interface MagazineMain : UIViewController<UITableViewDataSource,UITableViewDelegate,UITabBarDelegate>
{
	ApplicationCell *tmpCell;
    NSArray *data;
	 
	// referring to our xib-based UITableViewCell ('IndividualSubviewsBasedApplicationCell')
	UINib *cellNib;
    IBOutlet UITableView *table;
 
    IBOutlet  UIBarButtonItem *doneButton;
    
    //Shop *c;
  
       
    
}

@property (nonatomic, retain) IBOutlet ApplicationCell *tmpCell;
@property (nonatomic, retain) NSArray *data;
//@property(nonatomic,retain)MagazineBuy *b;
@property (nonatomic, retain) UINib *cellNib;
@property(nonatomic,retain) IBOutlet UITableView *table;
-(IBAction)doneButtonPressed:(id)sender;
-(IBAction)backButton:(id)sender;



@end
