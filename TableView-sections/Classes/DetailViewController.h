//
//  DetailViewController.h
//  TableView
//
//  Created by Jai Kirdatt on 1/17/09.
//  Copyright www.iPhoneSDKArticles.com 2009. 
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
	
	IBOutlet UILabel *lblText;
	NSString *selectedCountry;

}

@property (nonatomic, retain) NSString *selectedCountry;

@end
