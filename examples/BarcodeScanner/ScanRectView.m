//
//  ScanRectView.m
//  BarcodeScanner
//
//  Created by stopiccot on 2/25/16.
//  Copyright © 2016 Draconis Software. All rights reserved.
//

#import "ScanRectView.h"

@implementation ScanRectView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!self->points) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (debugParseStage < 2) {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    } else {
        CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    }
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0f);
    
    CGPoint p1 = ((NSValue*)self->points[0]).CGPointValue;
    CGPoint p2 = ((NSValue*)self->points[1]).CGPointValue;
    CGPoint p3 = ((NSValue*)self->points[2]).CGPointValue;

    CGContextMoveToPoint(context, p1.x, p1.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    CGContextAddLineToPoint(context, p3.x, p3.y);
    CGContextAddLineToPoint(context, p1.x, p1.y);
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

- (void)setPoints:(NSMutableArray*)pointsArray {
    self->points = pointsArray;
    [self setNeedsDisplay];
}

@end
