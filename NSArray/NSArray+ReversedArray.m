//
//  NSArray+ReversedArray.m
//  Cryptoquips
//
//  Created by Andrew King on 2015-02-28.
//
//

#import "NSArray+ReversedArray.h"

@implementation NSArray (ReversedArray)

- (NSArray *)reversedArray {
    NSMutableArray *newArray = [NSMutableArray array];
    for (NSInteger i=0; i<self.count; i++) {
        newArray[i] = self[self.count - (1+i)];
    }
    return [NSArray arrayWithArray:newArray];
}

@end
