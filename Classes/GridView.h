//
//  GridView.h
//  xlogo
//
//  Created by Matthew Hanlon on 6/9/15.
//
//

#import <Cocoa/Cocoa.h>

@interface GridView : NSView
{
    NSArray *_horizontalLines;
    NSArray *_verticalLines;
    NSInteger _lineWidth;
}

@end
