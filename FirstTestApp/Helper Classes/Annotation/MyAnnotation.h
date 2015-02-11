//
//  MyAnnotation.h
//  FirstTestApp
//
//  Created by Thakur VJ on 10/02/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapPin.h"
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D _coordinate;
}

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subtitle;

@property(nonatomic) CLLocationDegrees latitude;
@property(nonatomic) CLLocationDegrees longitude;
@property(nonatomic,readonly)CLLocationCoordinate2D coordinate;

- (id)initWithPin:(MapPin *)pin;
- (id)initWithLat:(double)lat longitude:(double)lng title:(NSString *)title subtitle:(NSString *)subtitle;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end

