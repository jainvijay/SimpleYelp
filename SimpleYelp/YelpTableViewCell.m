//
//  YelpTableViewCell.m
//  SimpleYelp
//
//  Created by Vijay Jain on 9/21/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import "YelpTableViewCell.h"
#import "UIImageView+AFNetworking.h"



@implementation YelpTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setRestaurant:(Restaurant *)restaurant {
    _restaurant = restaurant;
    self.nameLabel.text = restaurant.name;
    self.addressLabel.text = restaurant.address;
    [self.imageView setImageWithURL:[NSURL URLWithString:restaurant.imageUrl]];
    
}

@end
