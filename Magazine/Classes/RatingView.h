#import <UIKit/UIKit.h>

@interface RatingView : UIView
{
    float rating;
    UIImageView *backgroundImageView;
    UIImageView *foregroundImageView;
}

@property float rating;

@end
