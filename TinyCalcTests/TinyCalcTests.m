//
//  TinyCalcTests.m
//  TinyCalcTests
//
//  Created by Adis on 26/02/2017.
//  Copyright © 2017 Infinum. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CalculationViewController.h"

@interface CalculationViewController ()

// Expose private methods and properties via this neat trick
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

- (NSArray *)integersFromString:(NSString *)text;
- (NSInteger)resultForText:(NSString *)text;
- (void)calculate:(NSString *)text;

@end

@interface TinyCalcTests : XCTestCase

@property (nonatomic, strong) CalculationViewController *vc;

@end

@implementation TinyCalcTests

- (void)setUp
{
    [super setUp];

    self.vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CalculationViewController"];
    [self.vc loadViewIfNeeded]; // Force the view to load before the test
}

- (void)tearDown
{
    self.vc = nil;

    [super tearDown];
}

static NSString *rationalString = @"1 1 1 1 1";

- (void)testRationalStringToIntegerConversion
{
    NSArray *integers = [self.vc integersFromString:rationalString];
    XCTAssertEqual(integers.count, 5);
}

- (void)testRationalStringCaclulation
{
    NSInteger result = [self.vc resultForText:rationalString];
    XCTAssertEqual(result, 5);
}

- (void)testRationalStringLabelUpdate
{
    [self.vc calculate:rationalString];
    XCTAssertTrue([self.vc.resultLabel.text isEqualToString:@"=5"]);
}

static NSString *garbageString = @"1v1v    1j%!@v1v1####v1v1v1v1";

- (void)testGarbageStringToIntegerConversion
{
    NSArray *integers = [self.vc integersFromString:garbageString];
    XCTAssertEqual(integers.count, 9);
}

- (void)testGarbageStringCaclulation
{
    NSInteger result = [self.vc resultForText:garbageString];
    XCTAssertEqual(result, 9);
}

- (void)testGarbageStringLabelUpdate
{
    [self.vc calculate:garbageString];
    XCTAssertTrue([self.vc.resultLabel.text isEqualToString:@"=9"]);
}

static NSString *emptyString = @"";

- (void)testEmptyStringToIntegerConversion
{
    NSArray *integers = [self.vc integersFromString:emptyString];
    XCTAssertEqual(integers.count, 0);
}

- (void)testEmptyStringCaclulation
{
    NSInteger result = [self.vc resultForText:emptyString];
    XCTAssertEqual(result, 0);
}

- (void)testEmptyStringLabelUpdate
{
    [self.vc calculate:emptyString];
    XCTAssertTrue([self.vc.resultLabel.text isEqualToString:@""]);
}

@end
