//
//  Button_ExampleViewController.m
//  Button_Example
//
//  Created by Chakra on 07/04/11.
//  Copyright 2011 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import "Button_ExampleViewController.h"
#import "Item.h"

@implementation Button_ExampleViewController

@synthesize tableView,sections;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	[super loadView];
	sections = [[NSMutableArray alloc] init];
	
	for(int s=0;s<1;s++) { // 4 sections
		NSMutableArray *section = [[NSMutableArray alloc] init];
		for(int i=0;i<12;i++) {  // 12 items in each section 
			Item *item = [[Item alloc] init];
			item.link=@"New Screen";
			item.title=[NSString stringWithFormat:@"Item  %d", i];
			item.image=@"icon2.png";
			
			[section addObject:item];			
		}
		[sections addObject:section];
 }
}

	
	- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	//{
		return [sections count];
	}
	
	
	- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
		return 1;
	}
	
	- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {  
		NSMutableArray *sectionItems = [sections objectAtIndex:indexPath.section];
		int numRows = [sectionItems count]/4;
		return numRows * 80.0;
	} 
	
	
	- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
		
		NSString *sectionTitle = [NSString stringWithFormat:@"Section   %d", section];
		return sectionTitle;
	}
	
	
	- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
		
		static NSString *hlCellID = @"hlCellID";
		
		UITableViewCell *hlcell = [tableView dequeueReusableCellWithIdentifier:hlCellID];
		if(hlcell == nil) {
			hlcell =  [[[UITableViewCell alloc] 
						initWithStyle:UITableViewCellStyleDefault reuseIdentifier:hlCellID] autorelease];
			hlcell.accessoryType = UITableViewCellAccessoryNone;
			hlcell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		
		int section = indexPath.section;
		NSMutableArray *sectionItems = [sections objectAtIndex:section];
		
		int n = [sectionItems count];
		int i=0,i1=0; 
		
		while(i<n){
			int yy = 4 +i1*74;
			int j=0;
			for(j=0; j<4;j++){
				
				if (i>=n) break;
				Item *item = [sectionItems objectAtIndex:i];
				
				CGRect rect = CGRectMake(18+80*j, yy, 40, 40);
				UIButton *button=[[UIButton alloc] initWithFrame:rect];
				[button setFrame:rect];
				UIImage *buttonImageNormal=[UIImage imageNamed:item.image];
				[button setBackgroundImage:buttonImageNormal	forState:UIControlStateNormal];
				[button setContentMode:UIViewContentModeCenter];
				
				NSString *tagValue = [NSString stringWithFormat:@"%d%d", indexPath.section+1, i];
				button.tag = [tagValue intValue];
				//NSLog(@"....tag....%d", button.tag);
				
				[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
				[hlcell.contentView addSubview:button];
				[button release];
				
				UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake((80*j)-4, yy+44, 80, 12)] autorelease];
				label.text = item.title;
				label.textColor = [UIColor blackColor];
				label.backgroundColor = [UIColor clearColor];
				label.textAlignment = UITextAlignmentCenter;
				label.font = [UIFont fontWithName:@"ArialMT" size:12]; 
				[hlcell.contentView addSubview:label];
				
				i++;
			}
			i1 = i1+1;
		}
		return hlcell;
	}
	
	
	-(IBAction)buttonPressed:(id)sender {
		int tagId = [sender tag];
		int divNum = 0;
		if(tagId<100)
			divNum=10;
		else 
			divNum=100;
		int section = [sender tag]/divNum;
		section -=1; // we had incremented at tag assigning time 
		int itemId = [sender tag]%divNum;
		
		
		NSLog(@"...section = %d, item = %d", section, itemId);
		
		NSMutableArray *sectionItems = [sections objectAtIndex:section];
		Item *item = [sectionItems objectAtIndex:itemId];
		NSLog(@"..item pressed.....%@, %@", item.title, item.link);
		
	}
	
	



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
