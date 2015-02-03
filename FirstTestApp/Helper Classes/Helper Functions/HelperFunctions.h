//
//  HelperFunctions.h
//  FirstTestApp
//
//  Created by Thakur VJ on 29/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperFunctions : NSObject

+ (id)sharedInstance;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delgate cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSString *)otherTitle;

@end
