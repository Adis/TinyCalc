//
//  TinyCalcUITests.m
//  TinyCalcUITests
//
//  Created by Adis on 26/02/2017.
//  Copyright © 2017 Infinum. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TinyCalcUITests : XCTestCase

@end

@implementation TinyCalcUITests

- (void)setUp
{
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

    // Handle the random alert showing
//    [self addUIInterruptionMonitorWithDescription:@"Save humanity" handler:^BOOL(XCUIElement * _Nonnull interruptingElement) {
//        if (interruptingElement.buttons[@"Heck no!"]) {
//            [interruptingElement.buttons[@"Heck no!"] tap];
//        }
//        return YES;
//    }];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNavigationBarBehavior
{
    XCUIApplication *app = [[XCUIApplication alloc] init];

    // Test there's no navigation bar
    XCTAssertTrue(app.navigationBars.count == 0);

    [app.buttons[@"addButton"] tap];

    XCTAssertTrue(app.navigationBars.count > 0);

    // This can get really really complex really fast
    [[[[app.navigationBars[@"CalculationView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];

    XCTAssertTrue(app.navigationBars.count == 0);
}

- (void)testRationalCalculation
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"addButton"] tap];
    
    XCUIElement *inputtextfieldTextField = app.textFields[@"inputTextfield"];
    [inputtextfieldTextField tap];
    [inputtextfieldTextField typeText:@"1 2 3 4 5"];

    XCUIElement *label = app.staticTexts[@"resultLabel"];
    XCTAssertTrue([label.label isEqualToString:@"=15"]);
}

@end
