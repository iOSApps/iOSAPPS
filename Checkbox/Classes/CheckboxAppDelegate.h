#import <UIKit/UIKit.h>

@class CheckboxViewController;

@interface CheckboxAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CheckboxViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CheckboxViewController *viewController;

@end

