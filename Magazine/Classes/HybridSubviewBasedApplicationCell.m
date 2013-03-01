#import "HybridSubviewBasedApplicationCell.h"

#define MAX_RATING 5.0

@interface HybridSubviewBasedApplicationCellContentView : UIView
{
    ApplicationCell *_cell;
    BOOL _highlighted;
}

@end

@implementation HybridSubviewBasedApplicationCellContentView

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

@implementation HybridSubviewBasedApplicationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        cellContentView = [[HybridSubviewBasedApplicationCellContentView alloc] initWithFrame:CGRectInset(self.contentView.bounds, 0.0, 1.0) cell:self];
        cellContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        cellContentView.contentMode = UIViewContentModeLeft;
        [self.contentView addSubview:cellContentView];
        
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.bounds.size.width - 64.0, 25.0, 56.0, 21.0)];
        priceLabel.textAlignment = UITextAlignmentRight;
        priceLabel.font = [UIFont boldSystemFontOfSize:11.0];
        priceLabel.textColor = [UIColor colorWithWhite:0.23 alpha:1.0];
        priceLabel.highlightedTextColor = [UIColor whiteColor];
        priceLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        [self.contentView addSubview:priceLabel];
    }
    
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    cellContentView.backgroundColor = backgroundColor;
    priceLabel.backgroundColor = backgroundColor;
}

- (void)setPrice:(NSString *)newPrice
{
    [super setPrice:newPrice];
    priceLabel.text = newPrice;
}

- (void)dealloc
{
    [super dealloc];
}

@end
