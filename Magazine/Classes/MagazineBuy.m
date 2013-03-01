
#import "MagazineBuy.h"
#import "PDFFile.h"

@implementation MagazineBuy


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)Free
{
    PDFFile *A=[[PDFFile alloc]initWithNibName:@"PDFFile" bundle:nil];
    [self presentModalViewController:A animated:YES];
}

-(IBAction)Buy
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];
    string2=@"http://in.zinio.com/";
    
    MoreWebView *b=[[MoreWebView alloc]initWithNibName:@"MoreWebView" bundle:nil];
    b.s1=string2;
    
    [self presentModalViewController:b animated:YES];
    
}
-(IBAction)More
{
    //activityview code
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];
    
    string1=@"feed://magazinesdownload.com/syndication.axd";

    MoreWebView *b=[[MoreWebView alloc]initWithNibName:@"MoreWebView" bundle:nil];
    b.s1=string1;
    [self presentModalViewController:b animated:YES];
   
}

-(IBAction)BackMain
{
    //Activityview code
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];

    
    
    
    MagazineMain *a=[[MagazineMain alloc]initWithNibName:@"MagazineMain" bundle:nil];
    [self presentModalViewController:a animated:YES];
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
    //label.text=str;
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
