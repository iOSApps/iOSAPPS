
#import "MoreDetails.h"
#import "SingIn.h"


@implementation MoreDetails

@synthesize a,c,productName,table;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)BackItem:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
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
    
    //Tabbar item code
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
    
    
    
    
    productName = [[NSArray alloc]   initWithObjects:@"Create Account",@"Sign in",@"Legal Notices",@"Share on facebook",nil];
    
    self.title = @"Table view Example";
    table.backgroundColor = [UIColor clearColor];
    table.alpha = 0.9;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//item action code
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item { 
  //  MoreDetails *a;
    
    NSLog(@"Tab tab: %d",item.tag);
    switch (item.tag) {
        case 0:
            al=[[UIAlertView alloc]initWithTitle:@"" message:@"please login....." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [al show];
            
            break;
        case 1:
            //b1=[[Shop alloc]initWithNibName:@"Shop" bundle:nil];
            //[self presentModalViewController:b1 animated:YES];
            al=[[UIAlertView alloc]initWithTitle:@"" message:@"please login....." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [al show];

            break;
        case 2:
            /*a=[[MoreDetails alloc]initWithNibName:@"MoreDetails" bundle:nil];
            [self presentModalViewController:a animated:YES];*/
        default:
            break;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [productName count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView   dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero    reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [productName objectAtIndex:indexPath.row];
    
    //NSLog(@"dfdfdfdfd %@:",cell.text);
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    
    
       
    //ActivityView code
           
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];
    
    switch (indexPath.row) {
            
            
        case 0:
            
            // detailController = [[DetailView alloc]  initWithNibName:@"DetailView" bundle:nil];
            c=[[CreatingAccount alloc]initWithNibName:@"CreatingAccount" bundle:nil];
           
            [self presentModalViewController:c animated:YES];
            
            
            
            
            break;
        case 1:
            a=[[SingIn alloc]initWithNibName:@"SingIn" bundle:nil];
            [self presentModalViewController:a animated:YES];
            break;
                default:
            break;
               }
    
    
    /* DetailView *detailController = [[DetailView alloc]  initWithNibName:@"DetailView" bundle:nil];
     //[self.navigationController pushViewController:detailController  animated:YES];
     [self presentModalViewController:detailController animated:YES];
     [detailController detailText:[productName  objectAtIndex:indexPath.row]];
     */
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
