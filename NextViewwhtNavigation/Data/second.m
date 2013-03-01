//
//  second.m
//  Data
//
//  Created by Guest on 11/02/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import "second.h"
#import "ViewController.h"

@interface second ()

@end

@implementation second
@synthesize first,array;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    array=[[NSMutableArray alloc]initWithObjects:@"hi",@"bye", nil];
    first.array1=array;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"first cls array is %@",first.array1);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
