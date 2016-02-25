//
//  ScanRectView.h
//  BarcodeScanner
//
//  Created by stopiccot on 2/25/16.
//  Copyright © 2016 Draconis Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScanRectView : UIView
{
    NSMutableArray* points;
}

- (void)drawRect:(CGRect)rect;
- (void)setPoints:(NSMutableArray*)pointsArray;

@end
