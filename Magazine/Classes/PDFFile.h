
#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>
@interface PDFFile : UIViewController<QLPreviewControllerDataSource,QLPreviewControllerDelegate>
{
    QLPreviewController *qlViewController;
}
-(IBAction)BackPDF:(id)sender;

@end
