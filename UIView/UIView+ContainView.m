//
//  UIView+ContainView.m
//  Cryptoquips
//
//  Created by Andrew King on 2015-11-16.
//
//

#import "UIView+ContainView.h"

@implementation UIView (ContainView)

- (void)containView:(UIView *)innerView toView:(UIView *)outerView {
    [self addConstraints:@[
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:outerView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0
                                                         constant:0.0],
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:outerView
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0
                                                         constant:0.0],
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:outerView
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0
                                                         constant:0.0],
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:outerView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0
                                                         constant:0.0]
                           ]];
}

- (void)containView:(UIView *)innerView toView:(UIView *)outerView aboveBottomView:(UIView *)bottomView {
    [self addConstraints:@[
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:bottomView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0
                                                         constant:0],
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeRight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:outerView
                                                        attribute:NSLayoutAttributeRight
                                                       multiplier:1.0
                                                         constant:0.0],
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:outerView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0
                                                         constant:0.0],
                           [NSLayoutConstraint constraintWithItem:innerView
                                                        attribute:NSLayoutAttributeLeft
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:outerView
                                                        attribute:NSLayoutAttributeLeft
                                                       multiplier:1.0
                                                         constant:0.0]
                           ]];
}

@end
