//
//  Types.h
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Getthevalue.h"

@interface Types : UITableViewController<NSXMLParserDelegate> {
	IBOutlet UITableView *tb;
	NSMutableArray *array1,*array2,*array3,*array4,*array5,*array6,*array7,*img;
	// UITextField *t1,t2,t3;
	NSString *str21,*str22,*str23;
	BOOL xmlresult;
	NSXMLParser *xmlparser;
	NSMutableString *soapresult,*img2;
	NSString *atm1,*atm2;
	Getthevalue *get;
	
	
}
@property(nonatomic,retain)NSString *str21,*str22,*str23;
@property(nonatomic,retain)NSMutableArray *array1,*array2,*array3,*array4,*array5,*array6,*array7,*img;
@property(nonatomic,retain)NSMutableString *soapresult,*img2;
//@property(nonatomic,retain)NSArray *img;

@end
