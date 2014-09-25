//
//  Restaurant.m
//  SimpleYelp
//
//  Created by Vijay Jain on 9/22/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant


- (id)initWithRestaurantData:(NSDictionary *)restaurantData {
    self = [super init];
    if (self) {
        _restaurantId = restaurantData[@"id"];
        _name = restaurantData[@"name"];
        _address = restaurantData[@"location"][@"address"][0];
        _imageUrl = restaurantData[@"image_url"];
    }
    return self;
}

+ (NSArray *)restaurantFromYelpDict:(NSArray *) yelpDicts {
    NSArray *restaurants=[NSArray array];
    for(NSDictionary *restaurantData in yelpDicts){
        Restaurant *restaurant =  [[Restaurant alloc] initWithRestaurantData:restaurantData];
        restaurants = [restaurants arrayByAddingObject:restaurant];
    }
    return restaurants;
}
@end
