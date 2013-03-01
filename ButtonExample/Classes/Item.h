//
//  Item.h
//  Button_Example
//
//  Created by Chakra on 08/04/11.
//  Copyright 2011 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject {
	
	NSString *title;
	NSString *link;
	NSString *image;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *image;
@end
