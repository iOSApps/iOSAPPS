//
//  Async_LoadingViewController.m
//  Async Loading
//
//  Created by Charlie Key on 5/13/10.
//  Copyright Paranoid Ferret Productions 2010. All rights reserved.
//

#import "Async_LoadingViewController.h"

@implementation Async_LoadingViewController

- (void)viewDidLoad {
  /* 
  Synchronous Code 
  NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://farm5.static.flickr.com/4019/4473736899_ac386bdd05.jpg"]];
  UIImage* image = [[UIImage alloc] initWithData:imageData];
  [imageView setImage:image];
  [image release];
  [imageData release];
  */
  
  NSOperationQueue *queue = [NSOperationQueue new];
  NSInvocationOperation *operation = [[NSInvocationOperation alloc] 
                                      initWithTarget:self
                                      selector:@selector(loadImage) 
                                      object:nil];
  [queue addOperation:operation]; 
  [operation release];
}

- (void)loadImage {
  NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://farm5.static.flickr.com/4019/4473736899_ac386bdd05.jpg"]];
  UIImage* image = [[[UIImage alloc] initWithData:imageData] autorelease];
  [imageData release];
  [self performSelectorOnMainThread:@selector(displayImage:) withObject:image waitUntilDone:NO];
}

- (void)displayImage:(UIImage *)image {
  [imageView setImage:image];
}

- (void)dealloc {
  [super dealloc];
}

@end
