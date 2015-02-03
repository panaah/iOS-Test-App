//
//  UIScrollView+ZoomToPoint.h
//  test
//
//  Created by Shailesh Goel on 08/01/15.
//  Copyright (c) 2015 nc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ZoomToPoint)

- (void)zoomToPoint:(CGPoint)zoomPoint withScale: (CGFloat)scale animated: (BOOL)animated;

@end
