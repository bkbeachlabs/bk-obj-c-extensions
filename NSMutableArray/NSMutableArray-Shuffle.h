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
 * If this array has 0 or 1 elements, this does nothing.
 */
- (void)shuffle;

/**
 * Performs a swap shuffle, but guarantees that none of the objects are in the same place as before.
 * If this array has 0 or 1 elements, this does nothing. Arrays that contain many identical elements may result in unexpected behaviour.
 *
 */
- (void)shuffleWithGuaranteedDifferent;

@end
