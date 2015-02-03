//
//  LoginViewController.h
//  FirstTestApp
//
//  Created by Thakur VJ on 31/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    __weak IBOutlet UITextField *txtEmail;
    __weak IBOutlet UIButton *btnLogin;
}

- (IBAction)btnLoginClicked:(id)sender;

@end
