//
//  DetailViewController.h
//  SearchViewController
//
//  Created by Deepak Kumar on 04/08/09.
//  Copyright 2009 Rose India. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController 
{
	IBOutlet UILabel *label;
	NSString *selectedCountry;

}
@property(nonatomic, retain) NSString *selectedCountry;

@end
