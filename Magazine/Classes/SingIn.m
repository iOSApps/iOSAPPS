
#import "SingIn.h"
#import "MoreDetails.h"
@implementation SingIn
@synthesize field1,field2,status,databasePath; 

-(IBAction)BackButton:(id)sender
{
    MoreDetails *u=[[MoreDetails alloc]initWithNibName:@"MoreDetails" bundle:nil];
    [self presentModalViewController:u animated:YES];
}

-(IBAction)Return:(id)sender
{
    [sender resignFirstResponder];
}
-(IBAction)NewUser:(id)sender
{
    //Activityview code
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];

    
    
    CreatingAccount *c=[[CreatingAccount alloc]initWithNibName:@"CreatingAccount" bundle:nil];
    [self presentModalViewController:c animated:YES];
}
-(IBAction)Login:(id)sender
{
    sqlite3_stmt    *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
if([field1.text length]!=0 && [field2.text length]!=0)
{
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"select * from contacts where email=\"%@\"and password=\"%@\"", field1.text,field2.text];
        NSLog(@"%@",insertSQL); 
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
        NSLog(@"1");
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
           
            field1.text = @"";
            field2.text = @"";
            
            //Activityview code
            [self.view setBackgroundColor:[UIColor blackColor]];
            UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            CGRect f=CGRectMake(130, 100, 50, 50);
            [myActivityView setFrame:f];
            
            [myActivityView startAnimating];
            [self.view addSubview:myActivityView];

            
            
            
            MagazineMain *a=[[MagazineMain alloc]initWithNibName:@"MagazineMain" bundle:nil];
            [self presentModalViewController:a animated:YES];
            
        } else {
            status.text = @"password invalid";
            field1.text=@"";
            field2.text=@"";
        }
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }
}
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""message:@"Please enter email and password"delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
        
        [alert show];
    }
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"magazineambujex"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
		const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, EMAIL TEXT, PASSWORD TEXT, REPASSWORD TEXT)";
            
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                status.text =@"Failed to create table";
            }
            
            sqlite3_close(contactDB);
            
        } else {
            status.text = @"Failed to open/create database";
        }
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
