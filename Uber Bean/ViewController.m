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
#import "NetworkManager.h"
#import "Cafe.h"

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate, NetworkManagerProtocol>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NetworkManager *networkManager;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSMutableArray *cafes;
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
    self.cafes = [NSMutableArray new];
    
    
    NetworkManager *networkManager = [NetworkManager new];
    self.networkManager = networkManager;
    self.networkManager.delegate = self;
    [self.networkManager getData];
    

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

-(void)deliverCafes:(NSMutableArray<Cafe*>*)array {
    NSLog(@"delegate called %lu", (unsigned long)array.count);
    NSMutableArray *new = [[NSMutableArray alloc] initWithArray:array];
    self.cafes = new;

    
}

@end
