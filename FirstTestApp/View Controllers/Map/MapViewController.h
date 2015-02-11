//
//  MapViewController.h
//  FirstTestApp
//
//  Created by Thakur VJ on 10/02/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController
{
    __weak IBOutlet MKMapView *myMapView;
}

@end
