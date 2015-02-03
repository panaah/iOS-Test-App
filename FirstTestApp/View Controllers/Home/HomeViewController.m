//
//  ViewController.m
//  FirstTestApp
//
//  Created by Thakur VJ on 06/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "ComponentsViewController.h"
#import "FullScreenViewController.h"

@interface HomeViewController ()
{
    UIImage *mickyImage;
    UIButton *btnEnlarge;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"view did load");
    
//    self.title = @"Home";
    mickyImage = [UIImage imageNamed:@"2.jpeg"];
    
    btnEnlarge = [[UIButton alloc] initWithFrame:CGRectMake(250, 180, 65, 60)];
//    btnEnlarge.backgroundColor = [UIColor yellowColor];
    [btnEnlarge setBackgroundImage:mickyImage forState:UIControlStateNormal];
    [btnEnlarge addTarget:self action:@selector(btnEnlargeClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnEnlarge];
    
    
    switchColor.on = NO;
    UIBarButtonItem *rightButtonSwitch = [[UIBarButtonItem alloc] initWithCustomView:switchColor];
    self.navigationItem.rightBarButtonItem = rightButtonSwitch;
    
    UIButton *logout = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [logout setTitle:@"Logout" forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [logout addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnLogout = [[UIBarButtonItem alloc] initWithCustomView:logout];
    self.navigationItem.leftBarButtonItem = btnLogout;
    
    [self setupScroller];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom
- (void)setupScroller {
    int numberOfPages = 10;
    
    CGRect rectScroller = scroller.frame;
    rectScroller.size.width = [[UIScreen mainScreen] bounds].size.width;//_screenWidth
    scroller.frame = rectScroller;
    
    CGRect rect = scroller.frame;
    rect.origin.y = 0;
    
    for (int i = 0; i < numberOfPages; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:rect];
        if (i % 2 == 0) {
//            imgView.backgroundColor = [UIColor brownColor];
            imgView.image = [UIImage imageNamed:@"2.jpeg"];
        } else {
//            imgView.backgroundColor = [UIColor orangeColor];
            imgView.image = [UIImage imageNamed:@"3.jpeg"];
        }
        imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [scroller addSubview:imgView];
        
        rect.origin.x += rect.size.width;
    }
    [scroller setContentSize:CGSizeMake(scroller.frame.size.width * numberOfPages, scroller.frame.size.height)];
    pageControl.numberOfPages = numberOfPages;
}

#pragma mark - Actions
- (IBAction)btnHitMeClicked:(id)sender {
    ComponentsViewController *objComponentsVC = [ComponentsViewController new];
    [self.navigationController pushViewController:objComponentsVC animated:YES];
}

- (IBAction)switchColorValueChanged:(UISwitch *)sender {
    if (sender.isOn) {
        self.view.backgroundColor = [UIColor orangeColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


- (void)sayHello {
    NSLog(@"Hello VJ");
}

- (void)btnEnlargeClicked:(UIButton *)sender {
    NSLog(@"ok now implement the full screen controller");
    FullScreenViewController *objFullScreenVC = [FullScreenViewController new];
    objFullScreenVC.thumbImage = mickyImage;
    [self.navigationController pushViewController:objFullScreenVC animated:YES];
}

- (void)logoutClicked:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"email_id"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [UIView beginAnimations:@"flip_left_animation" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[[[UIApplication sharedApplication] delegate] window] cache:nil];
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[[GlobalPreferences sharedInstance] setupRootViewController]];
    [UIView commitAnimations];
}

#pragma mark - Textfield Delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    lblName.text = @"Hey there !! Enter your name";
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    lblName.text = textField.text;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@",string);
//    lblName.text = [NSString stringWithFormat:@"%@%@",textField.text,string];
    return YES;
}

#pragma mark - Segment Control
- (IBAction)segmentControlClicked:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if (control.selectedSegmentIndex == 0) {
        mickyImage = [UIImage imageNamed:@"1.jpg"];
    } else if(control.selectedSegmentIndex == 1) {
        mickyImage = [UIImage imageNamed:@"2.jpeg"];
    } else {
        mickyImage = [UIImage imageNamed:@"3.jpeg"];
    }
    [btnEnlarge setBackgroundImage:mickyImage forState:UIControlStateNormal];
}


#pragma mark - Scrollview Delegates
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint currentOffset = scrollView.contentOffset;
    int currentPage = currentOffset.x / [[UIScreen mainScreen] bounds].size.width;
    NSLog(@"current page = %ld",(long)currentPage);
    pageControl.currentPage = currentPage;
}

@end
