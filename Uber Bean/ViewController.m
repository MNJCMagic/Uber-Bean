//
//  ViewController.m
//  Uber Bean
//
//  Created by Mike Cameron on 2018-04-27.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CLLocationManager *locationManager = [CLLocationManager new];
    self.locationManager = locationManager;
    self.locationManager.delegate = self;
    self.mapView.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    self.mapView.showsUserLocation = YES;
//    [self.locationManager requestLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations[0];
    [self.mapView setRegion:MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.06, 0.06)) animated:YES];
    

}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"did error");
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];

    }
}

@end
