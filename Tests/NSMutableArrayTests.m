//
//  NSMutableArrayTests.m
//  Cryptoquips
//
//  Created by Andrew King on 2016-06-10.
//
//

#import <XCTest/XCTest.h>
#import "NSMutableArray-Shuffle.h"

@interface NSMutableArrayTests : XCTestCase

@end

@implementation NSMutableArrayTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - NSMutableArray+Shuffle

- (void)testCanShuffle {
    NSMutableArray *testArray = [self testArray];
    NSMutableArray *shuffleArray = [testArray mutableCopy];
    [shuffleArray shuffle];
    
    for (id thisElement in shuffleArray) {
        XCTAssert([testArray containsObject:thisElement]);
    }
    XCTAssert(testArray.count == shuffleArray.count);
}

//Note: this should just return with an unchanged array.
- (void)testCanShuffleArrayOfLength0 {
    NSMutableArray *testArray = [NSMutableArray array];
    NSMutableArray *shuffleArray = [testArray mutableCopy];
    [shuffleArray shuffle];
    
    XCTAssert(testArray.count == shuffleArray.count);
}

//Note: this should just return with an unchanged array.
- (void)testCanShuffleArrayOfLength1 {
    NSMutableArray *testArray = [NSMutableArray arrayWithObject:@1];
    NSMutableArray *shuffleArray = [testArray mutableCopy];
    [shuffleArray shuffle];
    
    for (id thisElement in shuffleArray) {
        XCTAssert([testArray containsObject:thisElement]);
    }
    XCTAssert(testArray.count == shuffleArray.count);
}

- (void)testCanShuffleWithGuaranteedDifferent {
    NSMutableArray *testArray = [self testArray];
    NSMutableArray *shuffleArray = [testArray mutableCopy];
    [shuffleArray shuffleWithGuaranteedDifferent];
    
    for (NSInteger i=0; i<testArray.count; i++) {
        id testNumber = testArray[i];
        id shuffleNumber = shuffleArray[i];
        XCTAssertFalse([testNumber isEqualToNumber:shuffleNumber]);
        XCTAssert([testArray containsObject:shuffleNumber]);
        XCTAssert([shuffleArray containsObject:testNumber]);
    }
    
    XCTAssert(testArray.count == shuffleArray.count);
    
}

//Note: this should just return with an unchanged array.
- (void)testCanShuffleArrayOfLength0WithGuaranteedDifferent {
    NSMutableArray *testArray = [NSMutableArray array];
    NSMutableArray *shuffleArray = [testArray mutableCopy];
    [shuffleArray shuffleWithGuaranteedDifferent];
    
    XCTAssert(testArray.count == shuffleArray.count);
}

//Note: this should just return with an unchanged array.
- (void)testCanShuffleArrayOfLength1WithGuaranteedDifferent {
    NSMutableArray *testArray = [NSMutableArray arrayWithObject:@1];
    NSMutableArray *shuffleArray = [testArray mutableCopy];
    [shuffleArray shuffleWithGuaranteedDifferent];
    
    for (id thisElement in shuffleArray) {
        XCTAssert([testArray containsObject:thisElement]);
    }
    XCTAssert(testArray.count == shuffleArray.count);
}



- (NSMutableArray *)testArray {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<100; i++) {
        [arr addObject:@(i)];
    }
    return arr;
}

@end
