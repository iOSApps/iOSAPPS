//
//  TableView.m
//  CheckMark
//
//  Created by Chakra on 03/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableView.h"


//@implementation TableView

@interface TableView ()
@property (nonatomic, retain) NSMutableArray *dataArray;

@end

@implementation TableView

@synthesize dataArray;

- (void)viewDidLoad
{
	// load our data from a plist file inside our app bundle
	NSString *path = [[NSBundle mainBundle] pathForResource:@"CheckMark" ofType:@"plist"];
	self.dataArray = [NSMutableArray arrayWithContentsOfFile:path];
	
/*	 NSMutableArray *array = [[NSArray alloc] initWithContentsOfFile:path];
	 self.dataArray = array;
	 [array release];*/
}


// called after the view controller's view is released and set to nil.
// For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
// So release any properties that are loaded in viewDidLoad or can be recreated lazily.
//
- (void)viewDidUnload
{
	self.dataArray = nil;
}


- (void)dealloc
{	
    [dataArray release];
	[super dealloc];
}


#pragma mark - UITableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [dataArray count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self tableView: self.tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCustomCellID = @"MyCellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomCellID];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCustomCellID] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	}
	
	NSMutableDictionary *item = [dataArray objectAtIndex:indexPath.row];
	cell.textLabel.text = [item objectForKey:@"text"];
	
	[item setObject:cell forKey:@"cell"];
	
	BOOL checked = [[item objectForKey:@"checked"] boolValue];
	UIImage *image = (checked) ? [UIImage imageNamed:@"checked.png"] : [UIImage imageNamed:@"unchecked.png"];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	CGRect frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
	button.frame = frame;	// match the button's size with the image size
	
	[button setBackgroundImage:image forState:UIControlStateNormal];
	
	// set the button's target to this table view controller so we can interpret touch events and map that to a NSIndexSet
	[button addTarget:self action:@selector(checkButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
	button.backgroundColor = [UIColor clearColor];
	cell.accessoryView = button;
	
	return cell;
}


- (void)checkButtonTapped:(id)sender event:(id)event
{
	NSSet *touches = [event allTouches];
	UITouch *touch = [touches anyObject];
	CGPoint currentTouchPosition = [touch locationInView:self.tableView];
	NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
	if (indexPath != nil)
	{
		[self tableView: self.tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
	}
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{	
	NSMutableDictionary *item = [dataArray objectAtIndex:indexPath.row];
	
	BOOL checked = [[item objectForKey:@"checked"] boolValue];
	
	[item setObject:[NSNumber numberWithBool:!checked] forKey:@"checked"];
	
	UITableViewCell *cell = [item objectForKey:@"cell"];
	UIButton *button = (UIButton *)cell.accessoryView;
	
	UIImage *newImage = (checked) ? [UIImage imageNamed:@"unchecked.png"] : [UIImage imageNamed:@"checked.png"];
	[button setBackgroundImage:newImage forState:UIControlStateNormal];
}

@end

