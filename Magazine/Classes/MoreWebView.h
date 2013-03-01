
#import <UIKit/UIKit.h>
#import "MagazineBuy.h"

@interface MoreWebView : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *mapDisplay;
    //UIActivityIndicatorView *a;
    UIActivityIndicatorView *myActivityView;
    NSString *s1;
}
@property(nonatomic,retain)IBOutlet UIWebView *mapDisplay;
@property(nonatomic,retain)NSString *s1;
-(IBAction)BackBuy:(id)sender;
@end
