//
//  GridView.m
//  xlogo
//
//  Created by Matthew Hanlon on 6/9/15.
//
//

#import "GridView.h"

@implementation GridView

- (void)dealloc
{
    [super dealloc];
    
    [_horizontalLines release];
    [_verticalLines release];
}

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self)
    {
        NSArray *lines = [self.horizontalLines arrayByAddingObjectsFromArray:self.verticalLines];
        
        for (NSView *lineView in lines)
        {
            [self addSubview:lineView];
        }
        _lineWidth = 4;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

//    [[NSColor redColor] setFill];
//    NSRectFill(dirtyRect);
    
    CGFloat width = self.frame.size.width;
    CGFloat thirdOfWidth = width / 3;
    
    for (int i = 0; i < 4; i++)
    {
        NSView *horizontalLine = self.horizontalLines[i];
        NSView *verticalLine = self.verticalLines[i];
        
        horizontalLine.frame = NSMakeRect(0, (i * thirdOfWidth), width, 0.5);
        
        NSRect verticalFrame = NSMakeRect((i * thirdOfWidth), 0, 0.5, width);
        
        if (i == 3)
        {
            verticalFrame.origin.x -= 0.5;
        }
        
        verticalLine.frame = verticalFrame;
    }    
}

- (NSArray *)horizontalLines
{
    if ( !_horizontalLines )
    {
        _horizontalLines = [self newArrayOfFourBlackViews];
    }
    
    return _horizontalLines;
}

- (NSArray *)verticalLines
{
    if ( !_verticalLines )
    {
        _verticalLines = [self newArrayOfFourBlackViews];
    }
    
    return _verticalLines;
}

- (NSArray *)newArrayOfFourBlackViews
{
    NSMutableArray *array = [NSMutableArray array];
    
    for ( int i = 0; i < 4; i++ )
    {
        NSView *view = [[NSView alloc] init];
        view.layer.backgroundColor = [[NSColor blackColor] CGColor];
        [array addObject:view];
    }
    
    return [array retain];
}


@end
