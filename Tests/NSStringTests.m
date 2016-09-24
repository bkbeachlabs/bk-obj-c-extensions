//
//  NSStringTests.m
//  Cryptoquips
//
//  Created by Andrew King on 2016-06-10.
//
//

#import <XCTest/XCTest.h>
#import "NSString+SentenceCaps.h"

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCanSentenceCapStrings {
    
    NSString *testString1 = [self theTestString1_lowerCaseMultipleSentences];
    NSString *testString4 = [self theTestString4_upperCaseStringMultipleSentences];
    NSString *testString7 = [self theTestString7_mixedCaseMultipleSentences];
    NSString *shouldBe1 = @"This string is all lowercase. it comprises three sentences. this is the third. plus some string after the last period";
    
    NSString *result1 = [testString1 sentenceCapitalizedString];
    NSString *result4 = [testString4 sentenceCapitalizedString];
    NSString *result7 = [testString7 sentenceCapitalizedString];
    
    XCTAssert([result1 isEqualToString:shouldBe1]);
    XCTAssert([result4 isEqualToString:shouldBe1]);
    XCTAssert([result7 isEqualToString:shouldBe1]);
    
    
    NSString *testString2 = [self theTestString2_lowerCaseSingleSentence];
    NSString *testString5 = [self theTestString5_upperCaseStringSingleSentence];
    NSString *testString8 = [self theTestString8_mixedCaseSingleSentence];
    NSString *shouldBe2 = @"This string is all lowercase, and has just one period.";
    NSString *result2 = [testString2 sentenceCapitalizedString];
    NSString *result5 = [testString5 sentenceCapitalizedString];
    NSString *result8 = [testString8 sentenceCapitalizedString];
    
    XCTAssert([result2 isEqualToString:shouldBe2]);
    XCTAssert([result5 isEqualToString:shouldBe2]);
    XCTAssert([result8 isEqualToString:shouldBe2]);
    
    
    NSString *testString3 = [self theTestString3_lowerCaseNoPeriods];
    NSString *testString6 = [self theTestString6_upperCaseStringNoPeriods];
    NSString *testString9 = [self theTestString9_mixedCaseNoPeriods];
    NSString *shouldBe3 = @"This string is all lowercase, and has no period";
    NSString *result3 = [testString3 sentenceCapitalizedString];
    NSString *result6 = [testString6 sentenceCapitalizedString];
    NSString *result9 = [testString9 sentenceCapitalizedString];
    
    XCTAssert([result3 isEqualToString:shouldBe3]);
    XCTAssert([result6 isEqualToString:shouldBe3]);
    XCTAssert([result9 isEqualToString:shouldBe3]);
}


- (void)testCanRealSentenceCapStrings {
    
    NSString *testString1 = [self theTestString1_lowerCaseMultipleSentences];
    NSString *testString4 = [self theTestString4_upperCaseStringMultipleSentences];
    NSString *testString7 = [self theTestString7_mixedCaseMultipleSentences];
    NSString *shouldBe1 = @"This string is all lowercase. It comprises three sentences. This is the third. Plus some string after the last period";
    
    NSString *result1 = [testString1 realSentenceCapitalizedString];
    NSString *result4 = [testString4 realSentenceCapitalizedString];
    NSString *result7 = [testString7 realSentenceCapitalizedString];
    
    XCTAssert([result1 isEqualToString:shouldBe1]);
    XCTAssert([result4 isEqualToString:shouldBe1]);
    XCTAssert([result7 isEqualToString:shouldBe1]);
    
    
    NSString *testString2 = [self theTestString2_lowerCaseSingleSentence];
    NSString *testString5 = [self theTestString5_upperCaseStringSingleSentence];
    NSString *testString8 = [self theTestString8_mixedCaseSingleSentence];
    NSString *shouldBe2 = @"This string is all lowercase, and has just one period.";
    NSString *result2 = [testString2 realSentenceCapitalizedString];
    NSString *result5 = [testString5 realSentenceCapitalizedString];
    NSString *result8 = [testString8 realSentenceCapitalizedString];
    
    XCTAssert([result2 isEqualToString:shouldBe2]);
    XCTAssert([result5 isEqualToString:shouldBe2]);
    XCTAssert([result8 isEqualToString:shouldBe2]);
    
    
    NSString *testString3 = [self theTestString3_lowerCaseNoPeriods];
    NSString *testString6 = [self theTestString6_upperCaseStringNoPeriods];
    NSString *testString9 = [self theTestString9_mixedCaseNoPeriods];
    NSString *shouldBe3 = @"This string is all lowercase, and has no period";
    NSString *result3 = [testString3 realSentenceCapitalizedString];
    NSString *result6 = [testString6 realSentenceCapitalizedString];
    NSString *result9 = [testString9 realSentenceCapitalizedString];
    
    XCTAssert([result3 isEqualToString:shouldBe3]);
    XCTAssert([result6 isEqualToString:shouldBe3]);
    XCTAssert([result9 isEqualToString:shouldBe3]);
}



- (NSString *)theTestString1_lowerCaseMultipleSentences {
     return [[self theTestString7_mixedCaseMultipleSentences] lowercaseString];
}

- (NSString *)theTestString2_lowerCaseSingleSentence {
    return [[self theTestString8_mixedCaseSingleSentence] lowercaseString];
}

- (NSString *)theTestString3_lowerCaseNoPeriods {
    return [[self theTestString9_mixedCaseNoPeriods] lowercaseString];
}

- (NSString *)theTestString4_upperCaseStringMultipleSentences {
    return [[self theTestString7_mixedCaseMultipleSentences] uppercaseString];
}

- (NSString *)theTestString5_upperCaseStringSingleSentence {
    return [[self theTestString8_mixedCaseSingleSentence] uppercaseString];
}

- (NSString *)theTestString6_upperCaseStringNoPeriods {
    return [[self theTestString9_mixedCaseNoPeriods] uppercaseString];
}

- (NSString *)theTestString7_mixedCaseMultipleSentences {
    return @"This string is all lowercase. it comprises THREE sentences. This is the third. plus some string after the last period";
}

- (NSString *)theTestString8_mixedCaseSingleSentence {
    return @"This string is all lowercase, and has just ONE period.";
}

- (NSString *)theTestString9_mixedCaseNoPeriods {
    return @"This string is ALL lowercase, and has No period";
}

@end
