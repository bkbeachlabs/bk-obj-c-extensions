//
//  UIFont+Emboss.h
//  Cryptoquips
//
//  Created by Andrew King on 2015-03-10.
//
//

#import <UIKit/UIKit.h>

@interface UIFont (Emboss)

/**
 * Returns a UIImage with the given String embossed with the given properties
 */
+ (UIImage *)embossedImageForString:(NSString *)string
                             inFont:(UIFont *)font
                               size:(CGSize)size
                          textColor:(UIColor *)textColor
                         upperColor:(UIColor *)upperColor
                         lowerColor:(UIColor *)lowerColor
                         sizedToFit:(BOOL)sizedToFit;
@end
