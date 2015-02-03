//
//  ViewController.h
//  FirstTestApp
//
//  Created by Thakur VJ on 06/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController {
    IBOutlet UILabel *lblName;
    __weak IBOutlet UITextField *txtName;
    __weak IBOutlet UISegmentedControl *segmentControl;
    __weak IBOutlet UISwitch *switchColor;
    
    __weak IBOutlet UIPageControl *pageControl;
    __weak IBOutlet UIScrollView *scroller;
}
- (IBAction)btnHitMeClicked:(id)sender;
- (IBAction)segmentControlClicked:(id)sender;
- (IBAction)switchColorValueChanged:(UISwitch *)sender;

- (void)sayHello;

@end

