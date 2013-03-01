//
//  Types.m
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Types.h"


@implementation Types
@synthesize array1,array2,array3,array4,array5,array6,array7,img,img2;
@synthesize str21,str22,str23;
@synthesize soapresult;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	self.title=@"types";
	array2=[[NSMutableArray alloc]init];
	array3=[[NSMutableArray alloc]init];
	array4=[[NSMutableArray alloc]init];
	array5=[[NSMutableArray alloc]init];
	array6=[[NSMutableArray alloc]init];
	array7=[[NSMutableArray alloc]init];
	
	img=[[NSMutableArray alloc]initWithObjects:@"atm.jpg",@"hosptal.jpg",@"hotel.jpg",nil];
	//NSString *str=[[NSBundle mainBundle]pathForResource:@"abdu" ofType:@"xml"];
	//NSArray *arr=[[NSArray alloc]initWithContentsOfFile:str];
	//NSLog(@"%@",arr);
	//NSLog(@"%@",str21);
	
	array1=[[NSMutableArray alloc]initWithObjects:@"ATM",@"HOSPITAL",@"HOTEL",@"SHOPPING MALL",nil];
	NSString *str4=[[NSString alloc]initWithFormat:@"http://maps.googleapis.com/maps/api/geocode/xml?address=%@/%@/%@&sensor=false",[str21 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[str22 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[str23 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSURL *url=[[NSURL alloc]initWithString:str4];
	//NSLog(@"%@",url);
	//NSString *str=[[NSString alloc]initWithContentsOfURL:url];
	//NSLog(@"%@",str);
	NSData *strdata=[[NSData alloc]initWithContentsOfURL:url];
	//NSLog(@"%@",strdata);
	xmlparser=[[NSXMLParser alloc]initWithData:strdata];
	//NSLog(@"%@",xmlparser);
	[xmlparser setDelegate:self];
	[xmlparser setShouldResolveExternalEntities:YES];
	[xmlparser parse];
	
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return[array1 count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text=[array1 objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	//if([elementName isEqualToString:@"location"])
	//{
	
	if([elementName isEqualToString:@"lat"])
	{
		if(!soapresult)
		{
			soapresult=[[NSMutableString alloc]init];
		}
		
	}
	else if([elementName isEqualToString:@"lng"] )
	{
		if(!soapresult)
		{
			soapresult=[[NSMutableString alloc]init];
		}
		
	}
	
	xmlresult=YES;
	
	
	
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if(xmlresult)
	{
		[soapresult appendString:string];
		//NSLog(@"%@",soapresult);
	}
	//NSLog(@"%@",soapresult);
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	//if([elementName isEqualToString:@"location"])	
	//{
	
	//xmlresult=FALSE;
	//}
	
	if([elementName isEqualToString:@"lat"])
	{ 
		if([array2 count]<1)
		{
			
			[array2 addObject:soapresult];
			
			soapresult=nil;
			NSLog(@"%@",array2);
		}
	}			
	if([elementName isEqualToString:@"lng"] )
	{
		if([array3 count]<1)
		{
			[array3 addObject:soapresult];
			soapresult=nil;
			NSLog(@"%@",array3);
		}
		
	}
	xmlresult=FALSE;
	//NSLog(@"%@",array2);
	//NSLog(@"%@",array3);
	
	//	[array4 addObject:[array2 objectAtIndex:0]];
	//	[array5 addObject:[array3 objectAtIndex:0]];
	//	NSLog(@"%@",array4);
	//	NSLog(@"%@",array5);
	
	
	
	
	
}						 

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
	switch (indexPath.row) {
		case 0:
			//Data *detailViewController = [[Data alloc] initWithNibName:@"Data" bundle:nil];
			//detailViewController.ar1=self.array2;
			//detailViewController.ar2=self.arr
			//UIImage *y=[UIImage imageNamed:@"10103254.jpg"];
			//cell.imageView.image=y;
			
			get=[[Getthevalue alloc]initWithNibName:@"getthevalue" bundle:nil];
			atm1=[array2 objectAtIndex:0];
			atm2=[array3 objectAtIndex:0];
			img2=[img objectAtIndex:0];
			//NSLog(@"%@",atm);
			NSString *url1=[[NSString alloc]initWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%@,%@&radius=5000&sensor=false&key=AIzaSyBGw0MB3DkFlveLwnCmAv2MlG5DJYxZt2s&name=atm",[atm1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[atm2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]; 
			NSURL *url13=[[NSURL alloc]initWithString:url1];
			NSString *url12=[[NSString alloc]initWithContentsOfURL:url13];
			//NSLog(@"%@",url12);
			//NSDictionary *dictionary=[[url12 JSONValue]objectForKey:@"results"];
			
			NSArray *dic=[(NSDictionary *)[url12 JSONValue]objectForKey:@"results"];
			//NSLog(@"%@",dictionary);
			
			// [super viewDidLoad];
			//}
			for(int i=0;i<[dic count];i++)
			{
				NSDictionary *d0=[[NSDictionary alloc]init];
				//NSArray *d0=[(NSDictionary *)objectForKey:@"geometry"];
				
				d0=[[dic objectAtIndex:i]objectForKey:@"geometry"];
				NSDictionary *d01=[[NSDictionary alloc]init];
				d01=[d0 objectForKey:@"location"];
				NSDictionary *d011=[[NSDictionary alloc]init];
				
				d011=[d01 objectForKey:@"lat"];
				NSDictionary *d012=[[NSDictionary alloc]init];
				d012=[d01 objectForKey:@"lng"];
				
				NSLog(@"%@",d011);
				NSLog(@"%@",d012);
				
				
				
				NSDictionary *d1=[[NSDictionary alloc]init];
				d1=[[dic objectAtIndex:i]objectForKey:@"name"];
				//NSLog(@"%@",d1);
				NSDictionary *d2=[[NSDictionary alloc]init];
				d2=[[dic objectAtIndex:i]objectForKey:@"vicinity"];
				[array4 addObject:d1];
				[array5 addObject:d2];
				[array6 addObject:d011];
				[array7 addObject:d012];
				
				
			}
			//NSLog(@"%@",array4);
			//NSLog(@"%@",array5);
			get.ar1=self.array4;
			get.ar2=self.array5;
			get.ar3=self.array6;
			get.ar4=self.array7;	 
			get.img12=self.img2;	 
			//[self presentModalViewController:detailViewController animated:YES];
			[[self navigationController]pushViewController:get animated:YES];
			//view=[[vie alloc]initWithNibName:@"Detail" bundle:nil];
			//view.ar2=self.array5;
			//[self presentModalViewController:view animated:YES];
			
			break;
		case 1:
			get=[[Getthevalue alloc]initWithNibName:@"getthevalue" bundle:nil];
			atm1=[array2 objectAtIndex:0];
			atm2=[array3 objectAtIndex:0];
			img2=[img objectAtIndex:1];
			//NSLog(@"%@",atm);
			NSString *url2=[[NSString alloc]initWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%@,%@&radius=5000&sensor=false&key=AIzaSyBGw0MB3DkFlveLwnCmAv2MlG5DJYxZt2s&name=hospital",[atm1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[atm2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]; 
			NSURL *url14=[[NSURL alloc]initWithString:url2];
			NSString *url1h=[[NSString alloc]initWithContentsOfURL:url14];
			//NSLog(@"%@",url12);
			//NSDictionary *dictionary=[[url12 JSONValue]objectForKey:@"results"];
			
			NSArray *dic1=[(NSDictionary *)[url1h JSONValue]objectForKey:@"results"];
			//NSLog(@"%@",dictionary);
			
			// [super viewDidLoad];
			//}
			for(int i=0;i<[dic1 count];i++)
			{
				NSDictionary *d0=[[NSDictionary alloc]init];
				//NSArray *d0=[(NSDictionary *)objectForKey:@"geometry"];
				
				d0=[[dic1 objectAtIndex:i]objectForKey:@"geometry"];
				NSDictionary *d01=[[NSDictionary alloc]init];
				d01=[d0 objectForKey:@"location"];
				NSDictionary *d011=[[NSDictionary alloc]init];
				
				d011=[d01 objectForKey:@"lat"];
				NSDictionary *d012=[[NSDictionary alloc]init];
				d012=[d01 objectForKey:@"lng"];
				
				
				
				
				
				NSDictionary *d1=[[NSDictionary alloc]init];
				
				d1=[[dic1 objectAtIndex:i]objectForKey:@"name"];
				//NSLog(@"%@",d1);
				NSDictionary *d2=[[NSDictionary alloc]init];
				d2=[[dic1 objectAtIndex:i]objectForKey:@"vicinity"];
				[array4 addObject:d1];
				[array5 addObject:d2];
				[array6 addObject:d011];
				[array7 addObject:d012];
				
			}
			//NSLog(@"%@",array4);
			//NSLog(@"%@",array5);
			get.ar1=self.array4;
			get.ar2=self.array5;
			get.ar3=self.array6;
			get.ar4=self.array7;
			get.img12=self.img2;
			//[self presentModalViewController:detailViewController animated:YES];
			[[self navigationController]pushViewController:get animated:YES];
			
			//Data *detailViewController = [[Data alloc] initWithNibName:@"Data" bundle:nil];
			//[self presentModalViewController:detailViewController animated:YES];
			break;
		case 2:
			get=[[Getthevalue alloc]initWithNibName:@"getthevalue" bundle:nil];
			atm1=[array2 objectAtIndex:0];
			atm2=[array3 objectAtIndex:0];
			img2=[img objectAtIndex:2];
			//NSLog(@"%@",atm);
			NSString *url3=[[NSString alloc]initWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%@,%@&radius=5000&sensor=false&key=AIzaSyBGw0MB3DkFlveLwnCmAv2MlG5DJYxZt2s&name=hotel",[atm1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[atm2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]; 
			NSURL *url15=[[NSURL alloc]initWithString:url3];
			NSString *url1hot=[[NSString alloc]initWithContentsOfURL:url15];
			//NSLog(@"%@",url12);
			//NSDictionary *dictionary=[[url12 JSONValue]objectForKey:@"results"];
			
			NSArray *dic2=[(NSDictionary *)[url1hot JSONValue]objectForKey:@"results"];
			//NSLog(@"%@",dictionary);
			
			// [super viewDidLoad];
			//}
			for(int i=0;i<[dic2 count];i++)
			{
				
				NSDictionary *d0=[[NSDictionary alloc]init];
				//NSArray *d0=[(NSDictionary *)objectForKey:@"geometry"];
				
				d0=[[dic2 objectAtIndex:i]objectForKey:@"geometry"];
				NSDictionary *d01=[[NSDictionary alloc]init];
				d01=[d0 objectForKey:@"location"];
				NSDictionary *d011=[[NSDictionary alloc]init];
				
				d011=[d01 objectForKey:@"lat"];
				NSDictionary *d012=[[NSDictionary alloc]init];
				d012=[d01 objectForKey:@"lng"];
				
				
				NSDictionary *d1=[[NSDictionary alloc]init];
				d1=[[dic2 objectAtIndex:i]objectForKey:@"name"];
				//NSLog(@"%@",d1);
				NSDictionary *d2=[[NSDictionary alloc]init];
				d2=[[dic2 objectAtIndex:i]objectForKey:@"vicinity"];
				[array4 addObject:d1];
				[array5 addObject:d2];
				[array6 addObject:d011];
				[array7 addObject:d012];
				
			}
			//NSLog(@"%@",array4);
			//NSLog(@"%@",array5);
			get.ar1=self.array4;
			get.ar2=self.array5;
			get.ar3=self.array6;
			get.ar4=self.array7;
			get.img12=self.img2;
			//[self presentModalViewController:detailViewController animated:YES];
			[[self navigationController]pushViewController:get animated:YES];
			
			
			
			//Data *detailViewController = [[Data alloc] initWithNibName:@"Data" bundle:nil];
			//[self presentModalViewController:detailViewController animated:YES];
			break;
		case 3:
			get=[[Getthevalue alloc]initWithNibName:@"getthevalue" bundle:nil];
			atm1=[array2 objectAtIndex:0];
			atm2=[array3 objectAtIndex:0];
			//NSLog(@"%@",atm);
			NSString *url4=[[NSString alloc]initWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%@,%@&radius=5000&sensor=false&key=AIzaSyBGw0MB3DkFlveLwnCmAv2MlG5DJYxZt2s&name=supermarket",[atm1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[atm2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]; 
			NSURL *url16=[[NSURL alloc]initWithString:url4];
			NSString *url1s=[[NSString alloc]initWithContentsOfURL:url16];
			//NSLog(@"%@",url12);
			//NSDictionary *dictionary=[[url12 JSONValue]objectForKey:@"results"];
			
			NSArray *dic3=[(NSDictionary *)[url1s JSONValue]objectForKey:@"results"];
			//NSLog(@"%@",dictionary);
			
			// [super viewDidLoad];
			//}
			for(int i=0;i<[dic3 count];i++)
			{
				NSDictionary *d0=[[NSDictionary alloc]init];
				//NSArray *d0=[(NSDictionary *)objectForKey:@"geometry"];
				
				d0=[[dic3 objectAtIndex:i]objectForKey:@"geometry"];
				NSDictionary *d01=[[NSDictionary alloc]init];
				d01=[d0 objectForKey:@"location"];
				NSDictionary *d011=[[NSDictionary alloc]init];
				
				d011=[d01 objectForKey:@"lat"];
				NSDictionary *d012=[[NSDictionary alloc]init];
				d012=[d01 objectForKey:@"lng"];
				
				
				NSDictionary *d1=[[NSDictionary alloc]init];
				d1=[[dic3 objectAtIndex:i]objectForKey:@"name"];
				//NSLog(@"%@",d1);
				NSDictionary *d2=[[NSDictionary alloc]init];
				d2=[[dic3 objectAtIndex:i]objectForKey:@"vicinity"];
				[array4 addObject:d1];
				[array5 addObject:d2];
				[array6 addObject:d011];
				[array7 addObject:d012];
				
			}
			//NSLog(@"%@",array4);
			//NSLog(@"%@",array5);
			get.ar1=self.array4;
			get.ar2=self.array5;
			get.ar3=self.array6;
			get.ar4=self.array7;
			get.img1=self.img;
			//[self presentModalViewController:detailViewController animated:YES];
			[[self navigationController]pushViewController:get animated:YES];
			
			
			
			//Data *detailViewController = [[Data alloc] initWithNibName:@"Data" bundle:nil];
			//[self presentModalViewController:detailViewController animated:YES];
			break;
			
			
			
		default:
			break;
	}
	
	// [self.navigationController pushViewController:detailViewController animated:YES];
	
	
}



#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

