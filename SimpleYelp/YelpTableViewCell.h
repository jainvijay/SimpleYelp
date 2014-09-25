//
//  YelpTableViewCell.h
//  SimpleYelp
//
//  Created by Vijay Jain on 9/21/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"

@interface YelpTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuisineLabel;
@property (weak, nonatomic) Restaurant *restaurant;

@end
