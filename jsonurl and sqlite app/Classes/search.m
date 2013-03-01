//
//  search.m
//  project
//
//  Created by arunbabu on 20/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "search.h"


@implementation search
@synthesize trainnumber;
@synthesize arrivaltext,departuretext,traintext,waitingtext,status;


-(IBAction)findtrain
{
	
	NSString *docsDir;
	NSArray *dirPaths;
	
	// Get the documents directory
	dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	docsDir = [dirPaths objectAtIndex:0];
	//array=[[NSMutableArray alloc]init];
	//array1=[[NSMutableArray alloc]init];
	
	// Build the path to the database file
	databasePath =  [docsDir stringByAppendingPathComponent: @"trains"];
	NSLog(@"%@",databasePath);
	NSFileManager *fn=[NSFileManager defaultManager];
	NSError *error;
	BOOL success=[fn fileExistsAtPath:databasePath];
	
	if(!success) {
		
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"trains"];
		success = [fn copyItemAtPath:defaultDBPath toPath:databasePath error:&error];
	}
	
	
	
	const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt    *statement;
	
	if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
	{
		NSString *querySQL = [NSString stringWithFormat: @"SELECT * FROM detail WHERE number=\"%@\"", trainnumber.text];
		
		const char *query_stmt = [querySQL UTF8String];
		
		if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
		{
			if (sqlite3_step(statement) == SQLITE_ROW)
			{
				
				NSString *arrival = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
				arrivaltext.text = arrival; 
				
				NSString *departure = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
				departuretext.text = departure;
				
			/*	NSString *train = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
				traintext.text = number; 
				
				
				NSString *waiting = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
				waitingtext.text = waittime;*/
				
				status.text = @"your train detail-";
				
				
				
				[arrival release];
				[departure release];
				//[number release];
				//[waittime release];
				
			} else {
				status.text = @"Match not found";
				arrivaltext.text = @"";
				departuretext.text = @"";
				traintext.text = @"";
				waitingtext.text = @"";
			}
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
}

-(IBAction)textFieldShouldReturn:(UITextField *)textField
{
	
	[textField resignFirstResponder];
	
}



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
