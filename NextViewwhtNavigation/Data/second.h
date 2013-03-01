//
//  second.h
//  Data
//
//  Created by Guest on 11/02/13.
//  Copyright (c) 2013 Guest. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface second : UIViewController
{
    NSMutableArray *array;
}
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)ViewController *first;
@end
