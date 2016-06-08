//
//  UIButton+Bounce.m
//  Cryptoquips
//
//  Created by Andrew King on 2015-02-13.
//
//

#import "UIButton+Bounce.h"

@implementation UIButton (Bounce)

- (void)highlightAndBounceButton:(UIButton *) sender {
    CGRect oldFrame = sender.frame;
    
    float SCALE = .10;//%
    CGRect newFrame = CGRectMake(sender.frame.origin.x*(1 - SCALE/2), sender.frame.origin.y*(1 - SCALE/2), sender.frame.size.width*(1 + SCALE), sender.frame.size.height*(1 + SCALE));
    
    // Fade out elements
    [UIView animateWithDuration:0.05
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sender.frame = newFrame;
                     }
                     completion:^ (BOOL completion){
                         
                         [UIView animateWithDuration:0.05 animations:^() {
                             sender.frame = oldFrame;
                         }];
                     }
     ];
}

@end
