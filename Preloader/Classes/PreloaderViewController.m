//
//  PreloaderViewController.m
//  Preloader
//
//  Created by NMG on 8/22/11.
//  Copyright 2011 NMG Resources, Inc. All rights reserved.
//

#import "PreloaderViewController.h"


@implementation PreloaderViewController 

- (void)loadView {
	[super loadView];
	
	link = @"http://oreilly.com/catalog/objectcpr/chapter/ch01.pdf";

	aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	aWebView.scalesPageToFit = YES;
	[aWebView setDelegate:self];
	
	progressView = [[UIProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
	progressView.frame = CGRectMake(60,150,200,20);
	progressView.progress = 0.00;
	
	progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(150,150,100,50)]; 
	progressLabel.backgroundColor = [UIColor clearColor];
	progressLabel.text = @"0\%";
	
	receivedData = [[NSMutableData alloc]init];
	NSURL *urlString = [NSURL URLWithString:link];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:urlString];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:requestObj delegate:self];
	[connection start];
	
	
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
	// Displays the progres bar and label
	[self.view addSubview:progressView];
	[self.view addSubview:progressLabel];
	
	// Gets the total data size
	totalfilesize = [response expectedContentLength];
	[receivedData setLength:0];
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	
	filesizereceived += [data length];
	filepercentage = (float)filesizereceived/(float)totalfilesize;
	progressView.progress = filepercentage;
	
	int p = 100 *filepercentage;
	NSString *percent = [NSString stringWithFormat: @"%d %%",p];
	
	progressLabel.text = percent;
	[receivedData appendData:data];
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection

{
	
    [aWebView loadData:receivedData MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
	[self.view addSubview:aWebView];
	[connection release];
	
}

- (void) dealloc {
	[aWebView release];
	[progressView release];
	[progressLabel release];
	[receivedData release];
	
	[super dealloc];
}
@end
