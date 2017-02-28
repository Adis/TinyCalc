//
//  CalculationViewController.m
//  TinyCalc
//
//  Created by Adis on 27/02/2017.
//  Copyright © 2017 Infinum. All rights reserved.
//

#import "CalculationViewController.h"

@interface CalculationViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

@end

@implementation CalculationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Calculation

- (void)calculate:(NSString *)text
{
    if (text.length == 0) {
        self.resultLabel.text = @"";
    } else {
        NSInteger result = [self resultForText:text];
        self.resultLabel.text = [NSString stringWithFormat:@"=%ld", result];
    }
}

- (NSInteger)resultForText:(NSString *)text
{
    NSArray *numbers = [self integersFromString:text];
    NSInteger result = 0;

    for (NSNumber *number in numbers) {
        result += number.integerValue;
    }

    return result;
}

// This is overcomplicating it for the sake of easier testing

- (NSArray *)integersFromString:(NSString *)text
{
    NSCharacterSet *nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *numbersStringArray = [text componentsSeparatedByCharactersInSet:nonNumbers];

    NSMutableArray *numbers = [NSMutableArray new];

    for (NSString *numberString in numbersStringArray) {
        if (numberString.length == 0) {
            continue;
        }
        NSNumber *number = [NSNumber numberWithInteger:[numberString integerValue]];
        [numbers addObject:number];
    }

    return numbers;
}

#pragma mark - UITextField delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self calculate:newString];

    return YES;
}

@end
