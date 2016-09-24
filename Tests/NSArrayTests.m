//
//  NSArrayTests.m
//  Cryptoquips
//
//  Created by Andrew King on 2016-06-10.
//
//

#import <XCTest/XCTest.h>
#import "NSArray+ReversedArray.h"

@interface NSArrayTests : XCTestCase

@end

@implementation NSArrayTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}



#pragma mark - NSArray+ReversedArray

- (void)testCanReverseArrayOfNoItems {
    NSArray *testArray = @[];
    NSArray *reversedArray = testArray.reversedArray;
    
    XCTAssert(reversedArray != nil);
    XCTAssert(reversedArray.count == 0);
    XCTAssert([reversedArray isEqualToArray:@[]]);
}

- (void)testCanReverseArrayOfOneItem {
    NSArray *testArray = @[@1];
    NSArray *reversedArray = testArray.reversedArray;
    
    XCTAssert(reversedArray != nil);
    XCTAssert(reversedArray.count == 1);
    XCTAssert([reversedArray isEqualToArray:@[@1]]);
}

- (void)testCanReverseArrayOfMultipleItems {
    NSArray *testArray = @[@1, @2, @3];
    NSArray *reversedArray = testArray.reversedArray;
    
    XCTAssert(reversedArray != nil);
    XCTAssert(reversedArray.count == 3);
    NSArray *shouldBe = @[@3, @2, @1];
    XCTAssert([reversedArray isEqualToArray:shouldBe]);
}



@end
