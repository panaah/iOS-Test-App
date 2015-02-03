//
//  HelperFunctions.m
//  FirstTestApp
//
//  Created by Thakur VJ on 29/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "HelperFunctions.h"
#import <UIKit/UIKit.h>

@implementation HelperFunctions

static HelperFunctions *shared = nil;
+ (id)sharedInstance {
    
    /*
    // Not a threadsafe way to intantiate a singleton class
    if (shared == nil) {
        shared = [[self alloc] init];
    } */
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delgate cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSString *)otherTitle {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delgate cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    [alert setCancelButtonIndex:1];
    [alert show];
}

@end
