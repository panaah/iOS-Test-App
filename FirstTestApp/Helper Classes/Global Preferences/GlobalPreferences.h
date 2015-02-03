//
//  GlobalPreferences.h
//  FirstTestApp
//
//  Created by Thakur VJ on 29/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalPreferences : NSObject

+ (id)sharedInstance;
- (id)setupRootViewController;

@end
