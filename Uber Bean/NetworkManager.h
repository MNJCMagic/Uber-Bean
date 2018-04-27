//
//  NetworkManager.h
//  Uber Bean
//
//  Created by Mike Cameron on 2018-04-27.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
@property (nonatomic, strong) NSDictionary *data;
-(NSDictionary*)getData;

@end
