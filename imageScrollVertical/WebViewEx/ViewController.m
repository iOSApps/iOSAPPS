//
//  ViewController.m
//  WebViewEx
//
//  Created by Guest on 30/01/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
UIScrollView * scroller;
UIWebView *web;
@implementation ViewController

-(void)viewDidLoad
{
    scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    scroller.pagingEnabled = YES;
    [web addSubview:scroller];
    
    
    int x = 0;
    NSArray *yourArray=[[NSArray alloc]init];
    yourArray=[NSArray arrayWithObjects:@"1",@"2",@"3",nil];//@"1",@"2",@"3",@"1" ,@"2",@"3",nil];
    NSArray *yourArray1=[[NSArray alloc]init];
    yourArray1=[NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSString *mainPath = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:mainPath];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"File" ofType:@"html"];
    NSString *pageHTML = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    [web loadHTMLString:pageHTML baseURL:baseURL];
    web.backgroundColor=[UIColor redColor];
    for (int i = 0; i < [yourArray count]; i++){
        
        UIImageView * myImageview = [[UIImageView alloc] initWithFrame:CGRectMake(x, 20, 160, 60)];
        UIImage *img = [[UIImage alloc]  initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[yourArray objectAtIndex:i] ofType:@"jpg"]];
        UILabel *imglabel=[[UILabel alloc]initWithFrame:CGRectMake(x, 220, 320, 20)];
        imglabel.text=[yourArray1 objectAtIndex:i];
        [myImageview setImage:img];

        [scroller addSubview:imglabel];
        
               [scroller addSubview:myImageview];
        
        
        x += myImageview.frame.size.width+10;
        
    }
   // web.scrollView.scrollEnabled = NO;
    web.scrollView.bounces = YES;
    [scroller setContentSize:CGSizeMake(x, 250)];
    [self.view addSubview:web];
    [super viewDidLoad];
}

/*@synthesize webView;
@synthesize back;
@synthesize forward;
@synthesize activityIndicator;


//method for going backwards in the webpage history
-(IBAction)backButtonPressed:(id)sender{
    
	[webView goBack];
}

//method for going forward in the webpage history
-(IBAction)forwardButtonPressed:(id)sender{
    
	[webView goForward];
}

//programmer defined method to load the webpage
-(void)startWebViewLoad{
    
	//NSString *urlAddress = @"http://www.google.com";
	NSString *urlAddress = @"http://cagt.bu.edu/page/IPhone-summer2010-wiki_problemsandsolutions";
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:urlAddress];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[webView loadRequest:requestObj];
	
}

// acivityIndicator is set up here
- (void)viewDidLoad {
	
	//start an animator symbol for the webpage loading to follow
	UIActivityIndicatorView *progressWheel = [[UIActivityIndicatorView alloc]
                                              initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
	//makes activity indicator disappear when it is stopped
	progressWheel.hidesWhenStopped = YES;
	
    //used to locate position of activity indicator
	progressWheel.center = CGPointMake(160, 160);
    
	self.activityIndicator = progressWheel;
	[self.view addSubview: self.activityIndicator];
	[self.activityIndicator startAnimating];
    
		[super viewDidLoad];
	
	//call another method to do the webpage loading
	[self performSelector:@selector(startWebViewLoad) withObject:nil afterDelay:0];
	
}




#pragma mark UIWebViewDelegate methods
//only used here to enable or disable the back and forward buttons
- (void)webViewDidStartLoad:(UIWebView *)thisWebView
{
	back.enabled = NO;
	forward.enabled = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)thisWebView
{
    
	//stop the activity indicator when done loading
	[self.activityIndicator stopAnimating];
    
    //canGoBack and canGoForward are properties which indicate if there is
    //any forward or backward history
	if(thisWebView.canGoBack == YES)
	{
		back.enabled = YES;
		back.highlighted = YES;
	}
	if(thisWebView.canGoForward == YES)
	{
		forward.enabled = YES;
		forward.highlighted = YES;
	}
	
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
@end
