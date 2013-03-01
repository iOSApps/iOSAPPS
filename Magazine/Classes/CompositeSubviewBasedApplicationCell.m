
#import "CompositeSubviewBasedApplicationCell.h"

#define MAX_RATING 5.0

@interface CompositeSubviewBasedApplicationCellContentView : UIView
{
    ApplicationCell *_cell;
    BOOL _highlighted;
}

@end

@implementation CompositeSubviewBasedApplicationCellContentView

- (id)initWithFrame:(CGRect)frame cell:(ApplicationCell *)cell
{
    if (self = [super initWithFrame:frame])
    {
        _cell = cell;
        
        self.opaque = YES;
        self.backgroundColor = _cell.backgroundColor;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [_cell.icon drawAtPoint:CGPointMake(11.0, 5.0)];

    _highlighted ? [[UIColor whiteColor] set] : [[UIColor blackColor] set];
    [_cell.name drawAtPoint:CGPointMake(81.0, 22.0) withFont:[UIFont boldSystemFontOfSize:17.0]];
    
    _highlighted ? [[UIColor whiteColor] set] : [[UIColor colorWithWhite:0.23 alpha:1.0] set];
    [_cell.publisher drawAtPoint:CGPointMake(81.0, 8.0) withFont:[UIFont boldSystemFontOfSize:11.0]];
    
    [[NSString stringWithFormat:@"%d Ratings", _cell.numRatings] drawAtPoint:CGPointMake(157.0, 46.0) withFont:[UIFont systemFontOfSize:11.0]];
    
    CGSize priceSize = [_cell.price sizeWithFont:[UIFont boldSystemFontOfSize:11.0]];
    [_cell.price drawAtPoint:CGPointMake(self.bounds.size.width - priceSize.width - 8.0, 28.0) withFont:[UIFont boldSystemFontOfSize:11.0]];
    
    CGPoint ratingImageOrigin = CGPointMake(81.0, 45.0);
    UIImage *ratingBackgroundImage = [UIImage imageNamed:@"StarsBackground.png"];
    [ratingBackgroundImage drawAtPoint:ratingImageOrigin];
    UIImage *ratingForegroundImage = [UIImage imageNamed:@"StarsForeground.png"];
    UIRectClip(CGRectMake(ratingImageOrigin.x, ratingImageOrigin.y, ratingForegroundImage.size.width * (_cell.rating / MAX_RATING), ratingForegroundImage.size.height));
    [ratingForegroundImage drawAtPoint:ratingImageOrigin];
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    [self setNeedsDisplay];
}

- (BOOL)isHighlighted
{
    return _highlighted;
}

@end

#pragma mark -

@implementation CompositeSubviewBasedApplicationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        cellContentView = [[CompositeSubviewBasedApplicationCellContentView alloc] initWithFrame:CGRectInset(self.contentView.bounds, 0.0, 1.0) cell:self];
        cellContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        cellContentView.contentMode = UIViewContentModeRedraw;
        [self.contentView addSubview:cellContentView];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    [UIView setAnimationsEnabled:NO];
    CGSize contentSize = cellContentView.bounds.size;
    cellContentView.contentStretch = CGRectMake(225.0 / contentSize.width, 0.0, (contentSize.width - 260.0) / contentSize.width, 1.0);
    [UIView setAnimationsEnabled:YES];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    cellContentView.backgroundColor = backgroundColor;
}

- (void)dealloc
{
	[super dealloc];
	
   }

@end
