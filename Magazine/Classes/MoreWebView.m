
#import "MoreWebView.h"



@implementation MoreWebView
@synthesize mapDisplay,s1;

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
-(IBAction)BackBuy:(id)sender
{
    MagazineBuy *a=[[MagazineBuy alloc]initWithNibName:@"MagazineBuy" bundle:nil];
    [self presentModalViewController:a animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor redColor]];
    
    //check code
    CGRect rect=CGRectMake(0, 40, 360, 480);
    UIWebView *web=[[UIWebView alloc]initWithFrame:rect];
    
    web.scalesPageToFit=YES;
    web.delegate=self;
   
    NSLog(@"%@",s1);
   
    NSURL *url=[NSURL URLWithString:s1];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    
    [self.view addSubview:web];
    
    mapDisplay.scalesPageToFit=YES;
    
    
    myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];

    
    
    /*
    NSString *urlAddress=@"https://www.magazinemall.in/BrowseMagazines.aspx";
    
    NSURL *url=[NSURL URLWithString:urlAddress];
    NSURLRequest *a=[NSURLRequest requestWithURL:url];
    [mapDisplay loadRequest:a];
*/
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


//ActivityView code
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [myActivityView startAnimating];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [myActivityView stopAnimating];
    //[webView stringByEvaluatingJavaScriptFromString:@"alert('Finished loading');"];
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [myActivityView stopAnimating];
    NSLog(@"Error :@",error);
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
