//
//  MapPin.m
//  FirstTestApp
//
//  Created by Thakur VJ on 10/02/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "MapPin.h"

@implementation MapPin

- (void)setupPin:(NSDictionary *)dictCity {
    self.latitude = [[dictCity valueForKey:@"cityLat"] doubleValue];
    self.longitude = [[dictCity valueForKey:@"cityLng"] doubleValue];
    self.title = [dictCity valueForKey:@"cityName"];
    self.subtitle = [dictCity valueForKey:@"cityName"];
}

@end
