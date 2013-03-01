//
//  ViewController.m
//  iAdds
//
//  Created by Guest on 15/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize bannerView = _bannerView;
@synthesize admobBannerView = _admobBannerView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [self.bannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:
                                                        ADBannerContentSizeIdentifierPortrait, nil]];
    self.bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    [self.bannerView setDelegate:self];
    [self.view addSubview:self.bannerView];
    [self bannerView:self.bannerView didFailToReceiveAdWithError:nil];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error 
{
    // 1
    [self.bannerView removeFromSuperview];
    // 2
    _admobBannerView = [[GADBannerView alloc]
                        initWithFrame:CGRectMake(0.0,400.0,
                                                 GAD_SIZE_320x50.width,
                                                 GAD_SIZE_320x50.height)];
    // 3
    self.admobBannerView.adUnitID = @"a14ec3f0a2028f2";
    self.admobBannerView.rootViewController = self;
    self.admobBannerView.delegate = self;
    // 4
    [self.view addSubview:self.admobBannerView];
    [self.admobBannerView loadRequest:[GADRequest request]];
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error 
{
    [self.admobBannerView removeFromSuperview];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
