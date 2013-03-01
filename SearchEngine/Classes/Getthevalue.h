//
//  Getthevalue.h
//  sample
//
//  Created by Snow Leopard User on 07/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Detail.h"
#import"Map1.h"


@interface Getthevalue : UITableViewController {
	NSMutableArray *ar1,*ar2,*ar3,*ar4,*img1;
	
	Detail *de;
	NSString *str,*str1,*str2,*str0;
    NSMutableString *img12;
}
@property(nonatomic,retain)NSMutableArray *ar1,*ar2,*ar3,*ar4,*img1;
@property(nonatomic,retain)NSString *str,*str1,*str2,*str0;
@property(nonatomic,retain)NSMutableString *img12;
@end
