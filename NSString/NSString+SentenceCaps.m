//
//  NSString+SentenceCaps.m
//  Cryptoquips
//
//  Created by Andrew King on 2014-12-28.
//
//

#import "NSString+SentenceCaps.h"

@implementation NSString (SentenceCaps)

- (NSString *)sentenceCapitalizedString {
    if (![self length]) {
        return [NSString string];
    }
    NSString *uppercase = [[self substringToIndex:1] uppercaseString];
    NSString *lowercase = [[self substringFromIndex:1] lowercaseString];
    return [uppercase stringByAppendingString:lowercase];
}

- (NSString *)realSentenceCapitalizedString {
    NSMutableString *resultString = [@"" mutableCopy];
    
    NSScanner *scanner = [NSScanner scannerWithString:self];
    while (!scanner.isAtEnd) {
        NSString *nextSentence;
        [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@".?!"] intoString:&nextSentence];
        [resultString appendString:[nextSentence sentenceCapitalizedString]];
        
        if (!scanner.isAtEnd) {
            NSString *nextEnding;
            [scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@".?! "] intoString:&nextEnding];
            [resultString appendString:nextEnding];
        }
    }
    return [NSString stringWithString:resultString];
}

@end
