//
//  NSArray-Shuffle.m
//  Cryptoquips
//
//  Created by Andrew King on 12-03-13.
//  Copyright (c) 2012 BK Beach Labs. All rights reserved.
//

#import "NSMutableArray-Shuffle.h"

@implementation NSMutableArray(Shuffle)

- (void)shuffle {
    if (self.count < 2) {
        return;
    }
    
    for (NSInteger i=0; i<self.count; i++) {
        [self swapObjectAtIndex:i];
    }
}

- (void)shuffleWithGuaranteedDifferent {
    if (self.count < 2) {
        return;
    }
    
    NSArray *originalArray = [self copy];
    [self shuffle];
    
    NSInteger matchingIndex = [self indexOfMatchingElements:self toArray:originalArray];
    while (matchingIndex != NSNotFound) {
        [self swapObjectAtIndex:matchingIndex];
        matchingIndex = [self indexOfMatchingElements:self toArray:originalArray];
    }
}

- (void)swapObjectAtIndex:(NSInteger)index {
    NSInteger randIndex = rand() % self.count;
    id randObject = self[randIndex];
    id thisObject = self[index];
    
    //Swap
    self[index] = randObject;
    self[randIndex] = thisObject;
}

- (NSInteger)indexOfMatchingElements:(NSArray *)array1 toArray:(NSArray *)array2 {
    NSAssert(array1.count == array2.count, @"Arrays must be of the same length.");
    
    for (NSInteger i=0; i<array1.count; i++) {
        if ([array1[i] isEqual:array2[i]]) {
            return i;
        }
    }
    return NSNotFound;
}

@end
