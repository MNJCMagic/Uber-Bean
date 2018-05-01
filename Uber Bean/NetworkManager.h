//
//  NetworkManager.h
//  Uber Bean
//
//  Created by Mike Cameron on 2018-04-27.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Cafe;

@protocol NetworkManagerProtocol <NSObject>

-(void)deliverCafes:(NSMutableArray<Cafe*>*)array;

@end


@interface NetworkManager : NSObject
@property (nonatomic, weak) id <NetworkManagerProtocol> delegate;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSMutableArray *cafes;
-(NSMutableArray*)makeCafes:(NSDictionary*)dictionary;
-(NSDictionary*)getData;

@end
