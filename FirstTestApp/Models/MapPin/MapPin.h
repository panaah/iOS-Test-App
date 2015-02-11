//
//  MapPin.h
//  FirstTestApp
//
//  Created by Thakur VJ on 10/02/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapPin : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *subtitle;
@property(nonatomic) double latitude;
@property(nonatomic) double longitude;

- (void)setupPin:(NSDictionary *)dictCity;

@end
