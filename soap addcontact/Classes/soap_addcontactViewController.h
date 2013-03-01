//
//  soap_addcontactViewController.h
//  soap addcontact
//
//  Created by jyothsna on 07/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface soap_addcontactViewController : UIViewController<NSXMLParserDelegate> {
	IBOutlet UITextField *t1;
	IBOutlet UITextField *t2;
	IBOutlet UITextField *t3;
	IBOutlet UITextField *t4;
	
	NSMutableData *webData;
	NSMutableString *soapResults;
	NSXMLParser *xmlParser;
	BOOL xmlResults;
}

@property(nonatomic, retain) IBOutlet UITextField *t1,*t2,*t3,*t4;
//@property(nonatomic, retain) IBOutlet UI
@property(nonatomic, retain) NSMutableData *webData;
@property(nonatomic, retain) NSMutableString *soapResults;
@property(nonatomic, retain) NSXMLParser *xmlParser;

-(IBAction)envoyer;



@end

