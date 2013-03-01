//
//  RootViewController.m
//  NSOperationTable
//
//  Created by Brandon Trebitowski on 3/4/10.
//  Copyright RightSprite 2010. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController
@synthesize array;

- (void)viewDidLoad {
    [super viewDidLoad];

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Load" 
																			  style:UIBarButtonItemStyleDone 
																			 target:self 
																			 action:@selector(loadData)];
	
	NSMutableArray *_array = [[NSMutableArray alloc] initWithCapacity:10000];
	self.array = _array;
	[_array release];
}

- (void) loadData {
	
	NSURL *dataURL = [NSURL URLWithString:@"http://icodeblog.com/samples/nsoperation/data.plist"];
	
	NSArray *tmp_array = [NSArray arrayWithContentsOfURL:dataURL];
	
	for(NSString *str in tmp_array) {
		[self.array addObject:str];
	}

	[self.tableView reloadData];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	[cell.textLabel setText:[self.array objectAtIndex:indexPath.row]];
	
    return cell;
}

- (void)dealloc {
    [super dealloc];
	[array release];
}

@end

