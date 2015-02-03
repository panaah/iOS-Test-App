//
//  ComponentsViewController.h
//  FirstTestApp
//
//  Created by Thakur VJ on 06/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComponentsViewController : UIViewController
{
    __weak IBOutlet UITextView *txtView;
    __weak IBOutlet UIDatePicker *dataPicker;
}

- (IBAction)dataPickerValueChanged:(UIDatePicker *)sender;

@end
