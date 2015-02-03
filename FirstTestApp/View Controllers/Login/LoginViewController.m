//
//  LoginViewController.m
//  FirstTestApp
//
//  Created by Thakur VJ on 31/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [txtEmail becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoginClicked:(id)sender {
    NSLog(@"login");
    if (txtEmail.text.length > 0) {
        [txtEmail resignFirstResponder];
        
        // TODO: check for valid email
        
        [[NSUserDefaults standardUserDefaults] setObject:txtEmail.text forKey:@"email_id"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [UIView beginAnimations:@"flip_right_animation" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[[[UIApplication sharedApplication] delegate] window] cache:nil];
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[[GlobalPreferences sharedInstance] setupRootViewController]];
        [UIView commitAnimations];
        
        
//        [UIView transitionWithView:self.view duration:0.75 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
//            [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[[GlobalPreferences sharedInstance] setupRootViewController]];
//        } completion:nil];
        
         
//        [UIView animateWithDuration:0.75 delay:0.0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
//            [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[[GlobalPreferences sharedInstance] setupRootViewController]];
//        } completion:nil];
    }
}

@end
