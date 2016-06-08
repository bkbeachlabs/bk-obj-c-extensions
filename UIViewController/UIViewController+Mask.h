//
//  UIViewController+Mask.h
//  Cryptoquips
//
//  Created by Andrew King on 2016-02-15.
//
//

#import <UIKit/UIKit.h>

typedef void (^UIViewAnimationCompletionBlock)(BOOL finished);


@interface UIViewController (Mask)

/**
 * Adds a mask to the View Controller's view. This leaves only the visibleRect unmasked.
 * The Array returned contains the 4 subviews used to create the mask and must be passed into the removeMask method.
 */
- (NSArray *)addMaskWithVisibleRect:(CGRect)visibleRect color:(UIColor *)color animationDuration:(NSTimeInterval)duration;

/**
 * Removes the mask from the View Controller's view.
 * The array must be the one created previously by the addMask method.
 */
- (void)removeMaskWithAnimationDuration:(NSTimeInterval)duration maskArray:(NSArray <UIView *>*)maskViews;


- (UIColor *)defaultMaskColor;

@end
