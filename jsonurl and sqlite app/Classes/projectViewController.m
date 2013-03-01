//
//  projectViewController.m
//  project
//
//  Created by arunbabu on 19/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "projectViewController.h"
#import "JSON.h"
#import "search.h"
#import "table.h"
@implementation projectViewController
@synthesize t,t1,t2,t3,t4;
@synthesize lh;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 

{
    [super viewDidLoad];
	t=[[NSMutableArray alloc]init];
	t1=[[NSMutableArray alloc]init];
	t2=[[NSMutableArray alloc]init];
	t3=[[NSMutableArray alloc]init];
	t4=[[NSMutableArray alloc]init];
	NSURL *json=[NSURL URLWithString:@"http://testapi.itransitbuddy.com/trains.php?station1=134&station2=55&trainlineid=8&devicetime=506&devicedate=2011-9-22&transitagencyid=1"];
	NSLog(@"json URL:%@",json);
	NSString *urldata=[[NSString alloc]initWithContentsOfURL:json];
	NSDictionary *dictionary=[[urldata JSONValue]objectForKey:@"trains"];
	
	for(int i=0;i<[dictionary count];i++)
	{
		NSDictionary *dic=[[NSDictionary alloc]init];
		dic=[[dictionary objectAtIndex:i]objectForKey:@"t11"];
		//NSLog(@"t11 is:%@",dic);
		[t addObject:dic];
		
		NSDictionary *dic1=[[NSDictionary alloc]init];
		dic1=[[dictionary objectAtIndex:i]objectForKey:@"t12"];
		//NSLog(@"t12 is:%@",dic1);
		[t1 addObject:dic1];
		
		NSDictionary *dic2=[[NSDictionary alloc]init];
		dic2=[[dictionary objectAtIndex:i]objectForKey:@"train_number"];
		[t2 addObject:dic2];
		NSLog(@"train number:%@",t2);
		
		NSDictionary *dic3=[[NSDictionary alloc]init];
		dic3=[[dictionary objectAtIndex:i]objectForKey:@"waitingtime"];
		[t3 addObject:dic3];
				
		NSDictionary *dic4=[[NSDictionary alloc]init];
		dic4=[[dictionary objectAtIndex:i]objectForKey:@"time"];
		[t4 addObject:dic4];
		NSLog(@"time:%@",t4);
							
	}
	
	//NSLog(@"Array t1:%@",t1);




}
-(IBAction)show
{
	table *obj1=[[table alloc]initWithNibName:@"table" bundle:nil];
	obj1.arr=self.t;
	obj1.arr1=self.t1;
	obj1.arr2=self.t2;
	obj1.arr3=self.t3;
	obj1.arr4=self.t4;
	[self presentModalViewController:obj1 animated:YES];
}


-(IBAction)insert
{
	
	
	
	
	NSFileManager *filemanager=[NSFileManager defaultManager];
	NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docdir=[path objectAtIndex:0];
	
	databasepath=[[NSString alloc]initWithString:[docdir stringByAppendingPathComponent:@"trains"]];
	
	BOOL success=[filemanager fileExistsAtPath:databasepath];
	NSLog(@"%@",databasepath);
	NSError *error;
	
	if(!success)
	{
		NSString *defaultdbpath=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"trains"];
		success=[filemanager copyItemAtPath:defaultdbpath toPath:databasepath error:&error];
	}
	const char *dbpath = [databasepath UTF8String];
	
	sqlite3_stmt *statement;
	
	
		for (int i=0; i<[t count]; i++) 
		
		{
			NSString *s1=[[NSString alloc]initWithString:[t objectAtIndex:i]];
			NSString *s2=[[NSString alloc]initWithString:[t1 objectAtIndex:i]];
			NSString *s3=[[NSString alloc]initWithString:[t2 objectAtIndex:i]];
			NSString *s4=[[NSString alloc]initWithString:[t3 objectAtIndex:i]];
			
			if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
			
			{
		
		
		NSString *querySQL = [NSString stringWithFormat: @"INSERT INTO detail VALUES (\"%@\",\"%@\",\"%@\",\"%@\")",s1,s2,s3,s4];
		
		const char *query_stmt = [querySQL UTF8String];
		
		sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL);
		NSLog(@"hi");
		
				if(sqlite3_step(statement) == SQLITE_DONE)
		{
			NSLog(@"added....!");
			lh.text=@"detail added";
			
		}
		else {
			lh.text=@"failed to add data";
			NSLog(@"failed......!");
		}
		
			}
		sqlite3_finalize(statement);
		
		sqlite3_close(contactDB);
		
			}
			
		}

	-(IBAction)search
{
	search *object=[[search alloc]initWithNibName:@"search" bundle:nil];
	[self presentModalViewController:object animated:YES];
}





/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
