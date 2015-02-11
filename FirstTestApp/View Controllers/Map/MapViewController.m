//
//  MapViewController.m
//  FirstTestApp
//
//  Created by Thakur VJ on 10/02/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "MapViewController.h"
#import "MapPin.h"
#import "MyAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadMapData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadMapData {
    NSString *pathToPlist = [[NSBundle mainBundle] pathForResource:@"CitiesOfIndaLatLng" ofType:@"plist"];
    NSArray *cities = [[NSArray alloc] initWithContentsOfFile:pathToPlist];
    
    NSMutableArray *arrLocations = [NSMutableArray new];
    
    for (NSDictionary *dictCity in cities) {
        MapPin *objPin = [MapPin new];
        [objPin setupPin:dictCity];
        [arrLocations addObject:objPin];
    }
    NSLog(@"%@",arrLocations);
    
    for (MapPin *pin in arrLocations) {
        MyAnnotation *objAnnotation = [[MyAnnotation alloc] initWithPin:pin];
        [myMapView addAnnotation:objAnnotation];
    }
}

#pragma mark Map Delegates
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"my_map_view_identifier";
    if ([annotation isKindOfClass:[MyAnnotation class]]) {
        MyAnnotation *myAnnotation = (MyAnnotation *)annotation;
        MKAnnotationView *view = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (view == nil) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier];
            view.enabled = YES;
            view.canShowCallout = YES;
            view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        } else {
            view.annotation = myAnnotation;
        }
        return view;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    // is used to open default maps application
    NSLog(@"open maps app if required");
}

@end
