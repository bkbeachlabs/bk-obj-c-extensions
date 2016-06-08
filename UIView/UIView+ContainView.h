//
//  UIView+ContainView.h
//  Cryptoquips
//
//  Created by Andrew King on 2015-11-16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (ContainView)

- (void)containView:(UIView *)innerView toView:(UIView *)outerView;

- (void)containView:(UIView *)innerView toView:(UIView *)outerView aboveBottomView:(UIView *)bottomView;

@end
