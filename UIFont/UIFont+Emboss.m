//
//  UIFont+Emboss.m
//  Cryptoquips
//
//  Created by Andrew King on 2015-03-10.
//
//

#import "UIFont+Emboss.h"

@implementation UIFont (Emboss)

+ (UIImage *)embossedImageForString:(NSString *)string
                             inFont:(UIFont *)font
                               size:(CGSize)size
                          textColor:(UIColor *)textColor
                         upperColor:(UIColor *)upperColor
                         lowerColor:(UIColor *)lowerColor
                         sizedToFit:(BOOL)sizedToFit {
    
    if (sizedToFit) {
        size = [self sizeOfStringThatFits:string inFont:font];
    }
    
    CGFloat upperDistance = -1;
    CGFloat upperBlur = 0;
    CGFloat bottomDistance = 1;
    CGFloat bottomBlur = 0;
    
    UIImage *interiorShadowImage = [self imageWithInteriorShadowAndString:string
                                                                     font:font
                                                                textColor:textColor
                                                              shadowColor:lowerColor
                                                           bottomDistance:bottomDistance
                                                               bottomBlur:bottomBlur
                                                                     size:size];
    
    UIImage *finalImage = [self imageWithUpwardShadowAndImage:interiorShadowImage
                                                   upperColor:upperColor
                                                upperDistance:upperDistance
                                                    upperBlur:upperBlur];
    
    return finalImage;
}

+ (CGSize)sizeOfStringThatFits:(NSString *)string inFont:(UIFont *)font {
    UILabel *sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    sizeLabel.font = font;
    sizeLabel.text = string;
    [sizeLabel sizeToFit];
    return sizeLabel.frame.size;
}

+ (UIImage *)maskWithString:(NSString *)string font:(UIFont *)font size:(CGSize)size {
    CGRect rect = { CGPointZero, size };
    CGFloat scale = [UIScreen mainScreen].scale;
    CGColorSpaceRef grayscale = CGColorSpaceCreateDeviceGray();
    CGContextRef gc = CGBitmapContextCreate(NULL, size.width * scale, size.height * scale, 8, size.width * scale, grayscale, kCGImageAlphaOnly);
    CGContextScaleCTM(gc, scale, scale);
    CGColorSpaceRelease(grayscale);
    UIGraphicsPushContext(gc); {
        [[UIColor whiteColor] setFill];
        [string drawInRect:rect withFont:font];
    } UIGraphicsPopContext();
    
    CGImageRef cgImage = CGBitmapContextCreateImage(gc);
    CGContextRelease(gc);
    UIImage *image = [UIImage imageWithCGImage:cgImage scale:scale orientation:UIImageOrientationDownMirrored];
    CGImageRelease(cgImage);
    
    return image;
}

+ (UIImage *)invertedMaskWithMask:(UIImage *)mask {
    CGRect rect = { CGPointZero, mask.size };
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, mask.scale); {
        [[UIColor blackColor] setFill];
        UIRectFill(rect);
        CGContextClipToMask(UIGraphicsGetCurrentContext(), rect, mask.CGImage);
        CGContextClearRect(UIGraphicsGetCurrentContext(), rect);
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithInteriorShadowAndString:(NSString *)string
                                         font:(UIFont *)font
                                    textColor:(UIColor *)textColor
                                  shadowColor:(UIColor *)shadowColor
                               bottomDistance:(CGFloat)bottomDistance
                                   bottomBlur:(CGFloat)bottomBlur
                                         size:(CGSize)size {
    
    CGRect rect = { CGPointZero, size };
    UIImage *mask = [self maskWithString:string font:font size:rect.size];
    UIImage *invertedMask = [self invertedMaskWithMask:mask];
    UIImage *image;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale); {
        CGContextRef gc = UIGraphicsGetCurrentContext();
        // Clip to the mask that only allows drawing inside the string's image.
        CGContextClipToMask(gc, rect, mask.CGImage);
        // We apply the mask twice because we're going to draw through it twice.
        // Only applying it once would make the edges too sharp.
        CGContextClipToMask(gc, rect, mask.CGImage);
        mask = nil; // done with mask; let ARC free it
        
        // Draw the red text.
        [textColor setFill];
        CGContextFillRect(gc, rect);
        
        // Draw the interior shadow.
        CGContextSetShadowWithColor(gc, CGSizeMake(0, bottomDistance), bottomBlur, shadowColor.CGColor);
        [invertedMask drawAtPoint:CGPointZero];
        invertedMask = nil; // done with invertedMask; let ARC free it
        
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithUpwardShadowAndImage:(UIImage *)image
                                upperColor:(UIColor *)upperColor
                             upperDistance:(CGFloat)upperDistance
                                 upperBlur:(CGFloat)upperBlur {
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale); {
        CGContextSetShadowWithColor(UIGraphicsGetCurrentContext(), CGSizeMake(0, -upperDistance), upperBlur, upperColor.CGColor);
        [image drawAtPoint:CGPointZero];
    }
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}


@end
