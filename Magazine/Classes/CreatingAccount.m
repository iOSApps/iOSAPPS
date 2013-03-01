
#import "CreatingAccount.h"


@implementation CreatingAccount

@synthesize email,password,repassword,status,checkbox,checkBoxLabel;



- (void) saveData
{ 
    
    sqlite3_stmt    *statement;
    
    const char *dbpath = [databasePath UTF8String];
  
   
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        if([email.text length]!=0 && [password.text length]!=0 && [repassword.text length]!=0 )
        {
            NSLog(@"########");
            if([password.text isEqualToString:repassword.text])
            {
                NSLog(@"&&&&&&&&&&&&&&&&&");
        
                NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO CONTACTS (email, password, repassword) VALUES (\"%@\", \"%@\", \"%@\")", email.text,password.text, repassword.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            //status.text = @"Contact added";
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""message:@"Registration completed ! "delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
            
            
            [alert show];
            email.text = @"";
            password.text = @"";
            repassword.text = @"";
            
            //ActivityView code
            [self.view setBackgroundColor:[UIColor blackColor]];
            UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            CGRect f=CGRectMake(130, 100, 50, 50);
            [myActivityView setFrame:f];
            
            [myActivityView startAnimating];
            [self.view addSubview:myActivityView];
            
            
            SingIn *a=[[SingIn alloc]initWithNibName:@"SingIn" bundle:nil];
            [self presentModalViewController:a animated:YES];
            
        } else {
           // status.text = @"Failed to add contact";
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""message:@"Email already existed ! "delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
            [alert show];
            email.text = @"";
            password.text = @"";
            repassword.text = @"";
        }
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }
            
    //}
        
    //}
            else
            {
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""message:@"Please enter same password and repassword !"delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
                
                
                [alert show];
            }
        }
        
        
       
        else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""message:@"Please enter all details !"delegate:self cancelButtonTitle:@"OK"otherButtonTitles: nil];
        
        
        [alert show];    
    }
    }
}

                
            
    
    


    
   // }
//}

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
    
	UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 416, 320, 44)];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"MyLibrary" image:[UIImage imageNamed:@"tab1.png" ] tag:0];
	// [item1 setBadgeValue:@"MyLibrary"];
    UITabBarItem *item2  = [[UITabBarItem alloc] initWithTitle:@"Shop" image:[UIImage imageNamed:@"tab2.png"] tag:1];
	//  [item2 setBadgeValue:@"Shop"];
    
    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:@"More.." image:[UIImage imageNamed:@"tab3.png"] tag:2];
	//  [item3 setBadgeValue:@"More.."];
    
    NSArray *items = [NSArray arrayWithObjects:item1,item2,item3, nil];
    [tabBar setItems:items animated:YES];
    [tabBar setSelectedItem:nil];
    tabBar.delegate=self;
    
    [self.view addSubview:tabBar];
    
    
    
    //check code
    checkBox = [[UIButton alloc] initWithFrame:CGRectMake(30, 250, 16, 16)];
    checkBox.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    checkBox.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    // Image for normal state
    UIImage *newNormalImage = [UIImage imageNamed:@"c1.png"];
    [checkBox setBackgroundImage:newNormalImage forState:UIControlStateNormal];
    // Image for highlighted state
    UIImage *newHighlightedImage = [UIImage imageNamed:@"cp.png"];
    [checkBox setBackgroundImage:newHighlightedImage forState:UIControlStateHighlighted];
    // Image for selected state
    UIImage *newSelectedImage = [UIImage imageNamed:@"cp1.png"];
    [checkBox setBackgroundImage:newSelectedImage forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(checkBoxSelect:)forControlEvents:UIControlEventTouchUpInside];
    checkBox.adjustsImageWhenHighlighted = YES;
    [checkBox setBackgroundColor:[UIColor clearColor]];
    [[self view] addSubview:checkBox];
    //checkBoxLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 90, 200, 40)];
    //[checkBoxLabel setText:@"Check Box"];
    [checkBox setBackgroundColor:[[ self view] backgroundColor]];
    //[[self view] addSubview:checkBoxLabel];
    
    
    
    
    
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
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, EMAIL TEXT, PASSWORD TEXT NOT NULL, REPASSWORD TEXT NOT NULL)";
            
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                status.text = @"Failed to create table";
            }
            
            sqlite3_close(contactDB);
            
        } else {
            status.text = @"Failed to open/create database";
        }
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


//item action code
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item { 
   
    
    
    NSLog(@"Tab tab: %d",item.tag);
    switch (item.tag) {
        case 0:
            a2=[[UIAlertView alloc]initWithTitle:@"" message:@"Please create account....." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [a2 show];
            
            break;
        case 1:
            a2=[[UIAlertView alloc]initWithTitle:@"" message:@"Please create account....." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [a2 show];
            break;
        case 2:
            [self dismissModalViewControllerAnimated:YES];
        default:
            break;
    }
}


//check code

-(void)checkBoxSelect:(id)sender
{
    if (checkboxSelected == 0)
    {
        [checkBox setSelected:YES];
        [checkBoxLabel setText:@"Check Box - Selected"];
        checkboxSelected = 1;
    }
    else
    {
        [checkBox setSelected:NO];
        [checkBoxLabel setText:@"Check Box"];
        checkboxSelected = 0;
    }
}

//return code

/*-(BOOL)textFileShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    //return YES;
}*/
-(IBAction)Key:(id)sender
{
    [sender resignFirstResponder];
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
