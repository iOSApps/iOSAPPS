
#import "Shop.h"


@implementation Shop
@synthesize productName,table;

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
   /* 
    //search bar code
    
    arrTemp=[productName mutableCopy];
    CGRect tableFrame=[self.tableView frame];
    CGRect searchRect=tableFrame;
    searchRect.size.height=40;
    search=[[UISearchBar alloc]initWithFrame:searchRect];
    search.delegate=self;
    self.tableView.tableHeaderView=search;
    searchDoneButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(searchDone:)];
    
    */
    
    
    //tabbar code
	UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 210, 320, 44)];
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
    
    
    
    productName = [[NSMutableArray alloc]   initWithObjects:@"Art",@"Automotive",@"Entertainment",@"Home",@"LifeStyle",@"Men",@"News",@"Sciences Tech",@"Sports",@"Travel",nil];
    
   // self.title = @"Table view Example";
   // tableView.backgroundColor = [UIColor clearColor];
   // tableView.alpha = 0.9;
    
    
    //serch bar in table view
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//tab bar item action
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item { 
    
    
    
    NSLog(@"Tab tab: %d",item.tag);
    
    switch (item.tag) {
        case 0:
            [self dismissModalViewControllerAnimated:YES];
            
            break;
        case 1:
            [self dismissModalViewControllerAnimated:YES];
            break;
        case 2:
            w=[[MoreWebView alloc]initWithNibName:@"MoreWebView" bundle:nil];
            [self presentModalViewController:w animated:YES];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero    reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [productName objectAtIndex:indexPath.row];
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
        case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            a=[[MagazineMain alloc]initWithNibName:@"MagazineMain" bundle:nil];
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
/*
//Search bar code
-(void)searchDone:(id)sender
{
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    [search resignFirstResponder];
}
-(void)doSearch
{
    NSString *searchFor=search.text;
    NSLog(@"helloooooooooo");
    
    productName=[arrTemp mutableCopy];
    if ([searchFor length]>0) {
        
        NSPredicate *p=[NSPredicate predicateWithFormat:searchFor];
        [productName filterUsingPredicate:p];
        
    }
    [self.tableView reloadData];

}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.navigationItem.rightBarButtonItem=searchDoneButton;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self doSearch];
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchDone:nil];
}
*/

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
