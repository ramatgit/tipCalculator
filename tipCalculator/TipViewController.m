//
//  ViewController.m
//  tipCalculator
//
//  Created by Rama Pillutla on 9/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:(YES)];
    [self updateValues];
}
- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    //calculate tip and total
    NSArray *tipValues = @[@(0.15), @(0.20), @(0.25)];
    
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue]*billAmount;
    float totalAmount = tipAmount + billAmount;
    
    //update the respective UI fields
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
