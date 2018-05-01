//
//  NetworkManager.m
//  Uber Bean
//
//  Created by Mike Cameron on 2018-04-27.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "NetworkManager.h"
#import "Cafe.h"


@implementation NetworkManager

-(NSDictionary*)getData {
    NSURL *url = [NSURL URLWithString:@"https://api.yelp.com/v3/businesses/search?term=cafe&latitude=43.647401&longitude=-79.379894"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"Bearer P9EGdkTohJJluZNxA9gjpYibSMog9OOKr0DfbZ86WYZ9wY3xFmaV2d69SmHLemfq5-AJFzQ8KEr1akn_mY9igrQxwjOJmPZSaOGmXkd2NfWd29igEVaVMnUsGnXjWnYx" forHTTPHeaderField:@"Authorization"];
    NSURLSessionTask *task;
    NSURLSession *session = [NSURLSession sharedSession];
    
    task = [session dataTaskWithRequest:request completionHandler:
            ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSLog(@"Got result!");
                NSDictionary* result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                self.data = result;
                [self makeCafes:self.data];
    }];
    [task resume];
    return self.data;
}

-(NSMutableArray*)makeCafes:(NSDictionary*)dictionary {
    NSMutableArray *cafes = [NSMutableArray new];
    self.cafes = cafes;
    NSLog(@"trying to make array");
    NSArray *temp = [[NSArray alloc] initWithArray:self.data[@"businesses"]];
    for (NSDictionary *dict in temp) {
        Cafe *tempCafe = [[Cafe alloc] initWithDictionary:dict];
        NSLog(@"%@", tempCafe.name);
        [self.cafes addObject:tempCafe];
        NSLog(@"Added cafe %ld", self.cafes.count);
        
    }
    NSLog(@"about to delegate");
    
    [self.delegate deliverCafes:self.cafes];
    return self.cafes;
}

@end
