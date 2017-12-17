//
//  NSString+SentenceCaps.h
//  Cryptoquips
//
//  Created by Andrew King on 2014-12-28.
//
//

#import <Foundation/Foundation.h>


@interface NSString (SentenceCaps)

/**
 * Capitalizes the first letter of a string (ie, add one capital in the entire string)
 */
- (NSString *)sentenceCapitalizedString;

/**
 * Capitalizes the first letter of a sentence, where a sentence is a real sentence (ie, delimited by a period)
 */
- (NSString *)realSentenceCapitalizedString;

@end
