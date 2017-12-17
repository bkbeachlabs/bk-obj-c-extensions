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


/**
 * Returns a translucent dark grey colour.
 *
 * @return [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.5];
 */
- (UIColor *)defaultMaskColor;

@end
