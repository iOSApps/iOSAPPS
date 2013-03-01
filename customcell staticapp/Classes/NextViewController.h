//
//  NextViewController.h
//  SimpleTable
//
//  Created by Adeem on 17/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NextViewController : UIViewController {
	IBOutlet UILabel *lblProductTxt;
}

- (IBAction) changeProductText:(NSString *)str;
@end
