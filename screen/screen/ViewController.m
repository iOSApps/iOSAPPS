//
//  ViewController.m
//  screen
//
//  Created by Guest on 07/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float xMargin=5;
    float yMargin=10;
    float buttonWidth=60;
    float buttonHeight=60;
    
    
    scrollView = [[UIScrollView alloc] init ];
    scrollView.frame=CGRectMake(0, 0, 1300, 1024);
    [scrollView setContentSize:CGSizeMake(900, 1400)];       
    
    for (int i=0; i<12 ; i++)
    {
        float xOrigin=((i%4))*(xMargin+buttonWidth)+30;
        float yOrigin=(i/4)*(yMargin+buttonHeight)+70;
        
        button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"1" forState:UIControlStateNormal];
        
        button.frame=CGRectMake(xOrigin, yOrigin, buttonWidth, buttonHeight);
        button.titleLabel.font= [UIFont fontWithName:@"Marker felt" size:14];
        button.tag=i+1;
        
        
        if(button.tag==1)
        {
            [button setTitle:@"1" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor greenColor]];
            
            [button addTarget:self action:@selector(playLevel) forControlEvents:UIControlEventTouchUpInside];
        }
        if(button.tag==2)
        {
            [button setTitle:@"2" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor grayColor]];
            
            [button addTarget:self action:@selector(playLevel1) forControlEvents:UIControlEventTouchUpInside];
        }
        if(button.tag==3)
        {
            [button setTitle:@"3" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor blueColor]];
        }
        if(button.tag==4)
        {
            [button setTitle:@"4" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor greenColor]];
            
        }
        if(button.tag==5)
        {
            [button setTitle:@"5" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor redColor]];
            
        }
        if(button.tag==6)
        {
            [button setTitle:@"6" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor orangeColor]];
            
        }
        if(button.tag==7)
        {
            [button setTitle:@"7" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor greenColor]];
        }if(button.tag==8)
        {
            [button setTitle:@"8" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor grayColor]];
        }if(button.tag==9)
        {
            [button setTitle:@"9" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor cyanColor]];
        }if(button.tag==10)
        {
            [button setTitle:@"10" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor blackColor]];
        }if(button.tag==11)
        {
            [button setTitle:@"11" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor brownColor]];
        }if(button.tag==12)
        {
            [button setTitle:@"12" forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor greenColor]];
            UIImage *im=[UIImage imageNamed:@"apple_developer.png"];
            [button setImage:im forState:UIControlStateNormal];
        }
        
        [self.view setBackgroundColor:[UIColor blackColor]];
        [scrollView addSubview:button];
        [scrollView setBackgroundColor:[UIColor redColor]];
        
        [self.view addSubview:scrollView]; 
        
    }
    

    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)playLevel
{
    NSLog(@"iam in first");
}

-(void)playLevel1
{
    NSLog(@"iam in second");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
