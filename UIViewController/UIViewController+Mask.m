//
//  UIViewController+Mask.m
//  Cryptoquips
//
//  Created by Andrew King on 2016-02-15.
//
//

#import "UIViewController+Mask.h"


@implementation UIViewController (Mask)

- (NSArray <UIView *>*)addMaskWithVisibleRect:(CGRect)visibleRect color:(UIColor *)color animationDuration:(NSTimeInterval)duration {
    NSLog(@"Adding mask to View Controller %@", self);
    
    UIView *top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, visibleRect.origin.y)];
    top.backgroundColor = color;
    
    CGFloat bottomY = visibleRect.origin.y + visibleRect.size.height;
    UIView *bottom = [[UIView alloc] initWithFrame:CGRectMake(0, bottomY, self.view.frame.size.width, self.view.frame.size.height - bottomY)];
    bottom.backgroundColor = color;
    
    UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, visibleRect.origin.y, visibleRect.origin.x, visibleRect.size.height)];
    left.backgroundColor = color;
    
    CGFloat rightX = visibleRect.origin.x + visibleRect.size.width;
    UIView *right = [[UIView alloc] initWithFrame:CGRectMake(rightX, visibleRect.origin.y, self.view.frame.size.width - rightX, visibleRect.size.height)];
    right.backgroundColor = color;
    
    [self.view addSubview:top];
    [self.view addSubview:bottom];
    [self.view addSubview:left];
    [self.view addSubview:right];
    
    top.alpha = 0;
    bottom.alpha = 0;
    left.alpha = 0;
    right.alpha = 0;
    
    [UIView animateWithDuration:duration animations:^{
        top.alpha = 1;
        bottom.alpha = 1;
        left.alpha = 1;
        right.alpha = 1;
    }];
    
    return @[top, bottom, left, right];
}

- (void)removeMaskWithAnimationDuration:(NSTimeInterval)duration maskArray:(NSArray <UIView *>*)maskViews {
    if (maskViews.count != 4) {
        NSLog(@"Failed to remove Mask from View Controller %@. The maskArray was invalid.", self);
        return;
    }
    
    UIView *top = maskViews[0];
    UIView *bottom = maskViews[1];
    UIView *left = maskViews[2];
    UIView *right = maskViews[3];
    
    [UIView animateWithDuration:duration animations:^{
        top.alpha = 0;
        bottom.alpha = 0;
        left.alpha = 0;
        right.alpha = 0;
    }];
    
    [top removeFromSuperview];
    [bottom removeFromSuperview];
    [left removeFromSuperview];
    [right removeFromSuperview];
    
    maskViews = nil;
}

- (UIColor *)defaultMaskColor {
    return [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.5];
}

@end
