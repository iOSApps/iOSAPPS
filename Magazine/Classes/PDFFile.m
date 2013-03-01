
#import "PDFFile.h"

@implementation PDFFile

-(IBAction)BackPDF:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
-(NSInteger) numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}
-(id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    NSString *documentLocation=[[NSBundle mainBundle]pathForResource:@"Focus" ofType:@"pdf"];
    NSURL *myDocument=[NSURL fileURLWithPath:documentLocation];
    return myDocument;
}
-(void)showPreview:(id)sender
{
    [self presentModalViewController:qlViewController animated:YES];
}
-(void)createUI
{
    UIButton *btnShowQuickLook=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnShowQuickLook.frame=CGRectMake(60, 400, 200, 34);
	btnShowQuickLook.backgroundColor=[UIColor redColor];
    [btnShowQuickLook setTitle:@"showPreview" forState:UIControlStateNormal];
    [btnShowQuickLook addTarget:self action:@selector(showPreview:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShowQuickLook];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    qlViewController=[[QLPreviewController alloc]init];
    qlViewController.dataSource=self;
    [self createUI];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
