//
//  Cafe.h
//  Uber Bean
//
//  Created by Mike Cameron on 2018-04-27.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Cafe : NSObject <MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) NSURL* imageURL;
@property (nonatomic, strong) NSString* name;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;
@end
