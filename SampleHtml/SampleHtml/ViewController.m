//
//  ViewController.m
//  SampleHtml
//
//  Created by Guest on 21/11/12.
//  Copyright (c) 2012 Guest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize web;

- (void)viewDidLoad
{
    //NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
    
    //NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    //[web loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
    
    //NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    //[web loadHTMLString:htmlString baseURL:nil];
    
    
    NSString *mainPath = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:mainPath];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"photo-feature" ofType:@"html"];
    NSString *pageHTML = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    [web loadHTMLString:pageHTML baseURL:baseURL];
    web.backgroundColor=[UIColor redColor];
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
