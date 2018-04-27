//
//  Cafe.m
//  Uber Bean
//
//  Created by Mike Cameron on 2018-04-27.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe

-(instancetype)initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _imageURL = [NSURL URLWithString:dictionary[@"image_url"]];
        _coordinate = CLLocationCoordinate2DMake([dictionary[@"coordinates"][@"latitude"] doubleValue], [dictionary[@"coordinates"][@"longitude"] doubleValue]);
        
    }
    return self;
}

@end
