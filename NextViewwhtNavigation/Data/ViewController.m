//
//  ViewController.m
//  Data
//
//  Created by Guest on 11/02/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import "ViewController.h"
#import "second.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize  array1;


-(IBAction)done:(id)sender
{
    second *se=[[second alloc]initWithNibName:@"second" bundle:nil];
    se.first=self;
    [self.navigationController pushViewController:se animated:YES];
    
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    //NSLog(@"first cls array is %@",array1);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
