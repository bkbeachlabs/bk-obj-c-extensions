//
//  NSArray-Shuffle.h
//  Cryptoquips
//
//  Created by Andrew King on 12-03-13.
//  Copyright (c) 2012 BK Beach Labs. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * Category of NSMutableArray.
 * Adds the ability to shuffle the contents of the array.
 */
@interface NSMutableArray(Shuffle)


/**
 * Performs a naive swap shuffle of the inputted array.
 */
- (void)shuffle;

/**
 * Performs a swap shuffle, but guarantees that none of the objects are in the same place as before.
 */
- (void)shuffleWithGuaranteedDifferent;

@end
