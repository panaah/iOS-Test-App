//
//  FullScreenViewController.h
//  FirstTestApp
//
//  Created by Thakur VJ on 07/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullScreenViewController : UIViewController
{
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UISlider *slider;
    __weak IBOutlet UIScrollView *scrollFullScreen;
}

@property(nonatomic,strong)UIImage *thumbImage;

-(IBAction)sliderValueChanged:(UISlider *)sender;

@end
