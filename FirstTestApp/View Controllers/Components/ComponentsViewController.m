//
//  ComponentsViewController.m
//  FirstTestApp
//
//  Created by Thakur VJ on 06/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "ComponentsViewController.h"

@interface ComponentsViewController ()

@end

@implementation ComponentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Components";
}

- (void)viewDidAppear:(BOOL)animated {
    [txtView becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated {
    [txtView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextView Delegates
- (void)textViewDidBeginEditing:(UITextView *)textView {
    textView.backgroundColor = [UIColor orangeColor];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    textView.backgroundColor = [UIColor lightTextColor];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%@",textView.text);
//    NSLog(@"%@",text);
//    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",textView.text,text]);
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"textViewDidChange = %@",textView.text);
}

#pragma mark - DatePicker Delegate
- (IBAction)dataPickerValueChanged:(UIDatePicker *)sender {
    NSLog(@"selected date = %@",sender.date);
//sender.tag
    if (sender.datePickerMode == UIDatePickerModeDate) {
        NSLog(@"Hey Im date picker");
    } else if(sender.datePickerMode == UIDatePickerModeTime) {
        NSLog(@"Hey Im time picker");
    } else {
        NSLog(@"Hey Im date time picker");
    }
    
}

@end
