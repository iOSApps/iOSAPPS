//
//  savedetaildatabaseViewController.m
//  savedetaildatabase
//
//  Created by rajan on 9/14/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "savedetaildatabaseViewController.h"
#import"n.h"

@implementation savedetaildatabaseViewController
@synthesize username,email_id,password,zipcode,status;

- (void) saveData
{
	/*NSString *docsDir;
	NSArray *dirPaths;
	
	// Get the documents directory
	dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	docsDir = [dirPaths objectAtIndex:0];
	
	// Build the path to the database file
	databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"sqlite1database"]];
	
	NSFileManager *filemgr = [NSFileManager defaultManager];*/
	
	sqlite3_stmt  *statement;
	
	const char *dbpath = [databasePath UTF8String];
	
	if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
	{
		//if(([username.text length]!='\0')&&([email_id.text length]!='\0')&&([password.text length]!='\0')&&([zipcode.text length]!='\0'))
		{
		NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO SIGNUPDETAILS (username,email_id, password, zipcode) VALUES (\"%@\", \"%@\", \"%@\",\"%@\")", username.text, email_id.text, password.text,zipcode.text];
		
		const char *insert_stmt = [insertSQL UTF8String];
		
		sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
		if (sqlite3_step(statement) == SQLITE_DONE)
		{
			status.text = @"Detail added";
			username.text = @"";
			email_id.text = @"";
			password.text = @"";
			zipcode.text=@"";
		} else {
			status.text = @"Failed to add details";
		}
		sqlite3_finalize(statement);
		sqlite3_close(contactDB);
	}
	}
}

- (void) findContact
{
	const char *dbpath = [databasePath UTF8String];
	sqlite3_stmt    *statement;
	
	if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
	{
		NSString *querySQL = [NSString stringWithFormat: @"SELECT * FROM SIGNUPDETAILS WHERE username=\"%@\"", username.text];
		
		const char *query_stmt = [querySQL UTF8String];
		
		if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
		{
			if (sqlite3_step(statement) == SQLITE_ROW)
			{
				//n *a=[[n alloc]initWithNibName:@"n" bundle:nil];
				//[self presentModalViewController:a animated:YES];
				NSString *email_idField1 = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
				username.text = email_idField1;
				
				NSString *email_idField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
				email_id.text = email_idField; 
				
				NSString *passwordField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
				password.text = passwordField;
				
				NSString *zipcodeField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
				zipcode.text = zipcodeField;
				
				status.text = @"Match found";
				
				[email_idField release];
				[passwordField release];
				[zipcodeField release];
				
			} else {
				status.text = @"Match not found";
				email_id.text = @"";
				password.text = @"";
				zipcode.text = @"";
			}
			sqlite3_finalize(statement);
		}
		sqlite3_close(contactDB);
	}
}

- (void)viewDidLoad {
	NSString *docsDir;
	NSArray *dirPaths;
	
	// Get the documents directory
	dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	docsDir = [dirPaths objectAtIndex:0];
	
	// Build the path to the database file
	databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"sqlite1database"]];
	
	NSFileManager *filemgr = [NSFileManager defaultManager];
	
	if ([filemgr fileExistsAtPath: databasePath ] == NO)
	{
		const char *dbpath = [databasePath UTF8String];
		
		if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
		{
			char *errMsg;
			const char *sql_stmt = "CREATE TABLE IF NOT EXISTS SIGNUPDETAILS(detailid integer primary key autoincrement ,username text, email_id text ,password text, zipcode text)";
			
			if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
			{
				status.text = @"Failed to create table";
			}
			
			sqlite3_close(contactDB);
			
		} else 
		{
			status.text = @"Failed to open/create database";
		}
	}
	
	[filemgr release];
	[super viewDidLoad];

}

-(IBAction)textfieldshouldreturn:(id)sender
{
	
	[sender resignFirstResponder];
	
}


/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
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
	self.username=nil;
	self.email_id=nil;
	self.password=nil;
	self.zipcode=nil;
}


- (void)dealloc {
	[username release];
	[email_id release]; 
	[password release];
	[zipcode release];
    [super dealloc];
}

@end

