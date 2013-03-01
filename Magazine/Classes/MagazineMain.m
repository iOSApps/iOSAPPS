
#import "MagazineMain.h"
#import "CompositeSubviewBasedApplicationCell.h"
#import "HybridSubviewBasedApplicationCell.h"
#import "SingIn.h"
#import "Shop.h"
#import "MoreDetails.h"


#define USE_INDIVIDUAL_SUBVIEWS_CELL    1	// use a xib file defining the cell
#define USE_COMPOSITE_SUBVIEW_CELL      0	// use a single view to draw all the content
#define USE_HYBRID_CELL                 0	// use a single view to draw most of the content + separate label to render the rest of the content




@implementation MagazineMain
@synthesize data,cellNib,table,tmpCell;



-(IBAction)backButton:(id)sender
{
    Shop *p=[[Shop alloc]initWithNibName:@"Shop" bundle:nil];
    [self presentModalViewController:p animated:YES]; 
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
    
   /* UINavigationItem *previousItem =
    [[UINavigationItem alloc] initWithTitle:@"Back Item"];
        
    UINavigationItem *currentItem =
    [[UINavigationItem alloc] initWithTitle:@"Main Title"];
    
    [navigationBar setItems:[NSArray arrayWithObjects:previousItem, currentItem, nil] animated:YES];
    
    
    [self.navigationItem.backBarButtonItem setTitle:@"Back"]; //title didn't changed
        [self.navigationItem.leftBarButtonItem setAction:self.navigationItem.backBarButtonItem.action]; //action didn't seted, no responce from button (button didn't da anything)
   
    */
    
   doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPressed:)];          
    self.navigationItem.rightBarButtonItem = doneButton ;
    
    
    
    
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	//DARK_BACKGROUND
	// Configure the table view.
    self.table.rowHeight = 73.0;
  //  self.tableView.backgroundColor = DARK_BACKGROUND ;
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
	// Load the data.
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    self.data = [NSArray arrayWithContentsOfFile:dataPath];
   
	// create our UINib instance which will later help us load and instanciate the
	// UITableViewCells's UI via a xib file.
	//
	// Note:
	// The UINib classe provides better performance in situations where you want to create multiple
	// copies of a nib file’s contents. The normal nib-loading process involves reading the nib file
	// from disk and then instantiating the objects it contains. However, with the UINib class, the
	// nib file is read from disk once and the contents are stored in memory.
	// Because they are in memory, creating successive sets of objects takes less time because it
	// does not require accessing the disk.
	//
	self.cellNib = [UINib nibWithNibName:@"IndividualSubviewsBasedApplicationCell" bundle:nil];
    // Do any additional setup after loading the view from its nib.
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item { 
    MoreDetails *a;
    Shop *b;
    NSLog(@"Tab tab: %d",item.tag);
    switch (item.tag) {
        case 0:
            a=[[MoreDetails alloc]initWithNibName:@"MoreDetails" bundle:nil];
            [self presentModalViewController:a animated:YES];
            break;
        case 1:
            b=[[Shop alloc]initWithNibName:@"Shop" bundle:nil];
            [self presentModalViewController:b animated:YES];
            
            break;
        case 2:
            a=[[MoreDetails alloc]initWithNibName:@"MoreDetails" bundle:nil];
            [self presentModalViewController:a animated:YES];
        default:
            break;
    }
}

-(IBAction) doneButtonPressed:(id) sender
{
    //Activityview code
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];

    
    SingIn *a=[[SingIn alloc]initWithNibName:@"SingIn" bundle:nil];
    [self presentModalViewController:a animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
   // return [items count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ApplicationCell";
    
    ApplicationCell *cell = (ApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil)
    {
#if USE_INDIVIDUAL_SUBVIEWS_CELL
        [self.cellNib instantiateWithOwner:self options:nil];
		cell = tmpCell;
		self.tmpCell = nil;
		
#elif USE_COMPOSITE_SUBVIEW_CELL
        cell = [[CompositeSubviewBasedApplicationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
#elif USE_HYBRID_CELL
        cell = [[HybridSubviewBasedApplicationCell alloc] initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
#endif
    }
    
	// Display dark and light background in alternate rows -- see tableView:willDisplayCell:forRowAtIndexPath:.
    cell.useDarkBackground = (indexPath.row % 2 == 0);
	
	// Configure the data for the cell.
    NSDictionary *dataItem = [data objectAtIndex:indexPath.row];
    cell.icon = [UIImage imageNamed:[dataItem objectForKey:@"Icon"]];
    cell.publisher = [dataItem objectForKey:@"Publisher"];
    cell.name = [dataItem objectForKey:@"Name"];
    cell.numRatings = [[dataItem objectForKey:@"NumRatings"] intValue];
    cell.rating = [[dataItem objectForKey:@"Rating"] floatValue];
    cell.price = [dataItem objectForKey:@"Price"];
 
	
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  cell.backgroundColor = ((ApplicationCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSLog(@"okokokokokoko");
    NSLog(@"indext path :  %d",indexPath.row);
    
    //ActivityView code
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIActivityIndicatorView *myActivityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect f=CGRectMake(130, 100, 50, 50);
    [myActivityView setFrame:f];
    
    [myActivityView startAnimating];
    [self.view addSubview:myActivityView];

    
    
                   MagazineBuy *b;
    switch (indexPath.row) {
            
            NSLog(@"%d",indexPath.row);
      /*  case 0:
            c=[[Shop alloc]initWithNibName:@"Shop" bundle:nil];
            [self presentModalViewController:c animated:YES];
            break;*/

        case 0:
            case 1:
            case 2:
            case 3:
         b=[[MagazineBuy alloc]initWithNibName:@"MagazineBuy" bundle:nil];
            [self presentModalViewController:b animated:YES];
            
        default:
            break;
    }   
    
       
    
   
    
}
 





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.data = nil;
	self.tmpCell = nil;
	self.cellNib = nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
