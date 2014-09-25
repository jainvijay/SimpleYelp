//
//  Restaurant.h
//  SimpleYelp
//
//  Created by Vijay Jain on 9/22/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (nonatomic) NSString *restaurantId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *imageUrl;

- (id)initWithRestaurantData:(NSDictionary *)restaurantData;
+ (NSArray *)restaurantFromYelpDict:(NSArray *)movieDicts;

@end
