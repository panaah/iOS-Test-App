//
//  FullScreenViewController.m
//  FirstTestApp
//
//  Created by Thakur VJ on 07/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "FullScreenViewController.h"
#import "UIScrollView+ZoomToPoint.h"

@interface FullScreenViewController ()

@end

@implementation FullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Full Screen";
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [scrollFullScreen addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [singleTap requireGestureRecognizerToFail:doubleTap];
    [scrollFullScreen addGestureRecognizer:doubleTap];
}

- (void)viewWillAppear:(BOOL)animated {
    imgView.image = self.thumbImage;
    
//    imgView.alpha = slider.value;
//    slider.value = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom
- (void)handleSingleTap:(UITapGestureRecognizer *)gesture {
    NSLog(@"single tap");
    if (self.navigationController.navigationBarHidden == NO) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self.tabBarController.tabBar setHidden:YES];
    } else {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self.tabBarController.tabBar setHidden:NO];
    }
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)gesture {
    NSLog(@"handleDoubleTap called");
    CGPoint tappedPoint = [gesture locationInView:imgView];
    if (scrollFullScreen.zoomScale == scrollFullScreen.minimumZoomScale) { // 1
//        [scrollFullScreen setZoomScale:scrollFullScreen.maximumZoomScale animated:YES];
        [scrollFullScreen zoomToPoint:tappedPoint withScale:scrollFullScreen.maximumZoomScale animated:YES];
    } else {
//        [scrollFullScreen setZoomScale:scrollFullScreen.minimumZoomScale animated:YES];
        [scrollFullScreen zoomToPoint:tappedPoint withScale:scrollFullScreen.minimumZoomScale animated:YES];
    }
}


#pragma mark - Slider Handler
-(IBAction)sliderValueChanged:(UISlider *)sender {
//    alpha = 1 // Full Visible
//    alpha = 0 // InVisible
    NSLog(@"%f",sender.value);
    imgView.alpha = sender.value;
}

#pragma mark - ScrollView Delegates 
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imgView;
}

@end
