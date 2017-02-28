//
//  RootViewController.m
//  TinyCalc
//
//  Created by Adis on 26/02/2017.
//  Copyright © 2017 Infinum. All rights reserved.
//

#import "RootViewController.h"

static NSString *didShowAlertKey = @"nng92";

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self showRandomAlert];
}

#pragma mark - Actions

- (IBAction)openAddition:(id)sender
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CalculationViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Alerts

- (void)showRandomAlert
{
    // Show alert only once
    if ([[NSUserDefaults standardUserDefaults] boolForKey:didShowAlertKey]) {
        return;
    }

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hi"
                                                                   message:@"Destroy all humanity?"
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"Sure!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];

    UIAlertAction *definitely = [UIAlertAction actionWithTitle:@"Absolutely!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];

    UIAlertAction *no = [UIAlertAction actionWithTitle:@"Heck no!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];

    [alert addAction:yes];
    [alert addAction:definitely];
    [alert addAction:no];

    [self presentViewController:alert animated:YES completion:^{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:didShowAlertKey];
    }];
}

@end
