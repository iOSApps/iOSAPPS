#import "RatingView.h"

#define MAX_RATING 5.0

@implementation RatingView

- (void)_commonInit
{
    backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsBackground.png"]];
    backgroundImageView.contentMode = UIViewContentModeLeft;
    [self addSubview:backgroundImageView];
    
    foregroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsForeground.png"]];
    foregroundImageView.contentMode = UIViewContentModeLeft;
    foregroundImageView.clipsToBounds = YES;
    [self addSubview:foregroundImageView];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self _commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder])
    {
        [self _commonInit];
    }
    
    return self;
}

- (void)setRating:(float)newRating
{
    rating = newRating;
    foregroundImageView.frame = CGRectMake(0.0, 0.0, backgroundImageView.frame.size.width * (rating / MAX_RATING), foregroundImageView.bounds.size.height);
}

- (float)rating
{
    return rating;
}

- (void)dealloc
{
	[super dealloc];
}

@end
