//
//  MyAnnotation.m
//  FirstTestApp
//
//  Created by Thakur VJ on 10/02/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "MyAnnotation.h"
#import "MapPin.h"

@implementation MyAnnotation

- (id)initWithPin:(MapPin *)pin {
    self = [super init];
    if (self) {
        self.latitude = pin.latitude;
        self.longitude = pin.longitude;
        self.title = pin.title;
        self.subtitle = pin.subtitle;
        
        _coordinate.latitude = self.latitude;
        _coordinate.longitude = self.longitude;
    }
    return self;
}

- (id)initWithLat:(double)lat longitude:(double)lng title:(NSString *)title subtitle:(NSString *)subtitle {
    self = [super init];
    if (self) {
        self.latitude = lat;
        self.longitude = lng;
        self.title = title;
        self.subtitle = subtitle;
    }
    return self;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    _coordinate = newCoordinate;
    self.latitude = _coordinate.latitude;
    self.longitude = _coordinate.longitude;
}

@end
