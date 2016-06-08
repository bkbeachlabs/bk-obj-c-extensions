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
    __block NSMutableString *mutableSelf = [NSMutableString stringWithString:self];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationBySentences
                          usingBlock:^(NSString *sentence, NSRange sentenceRange, NSRange enclosingRange, BOOL *stop) {
                              [mutableSelf replaceCharactersInRange:sentenceRange withString:[sentence sentenceCapitalizedString]];
                          }];
    return [NSString stringWithString:mutableSelf]; // or just return mutableSelf.
}
@end
