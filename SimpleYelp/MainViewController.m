//
//  MainViewController.m
//  SimpleYelp
//
//  Created by Vijay Jain on 9/21/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import "MainViewController.h"
#import "YelpClient.h"
#import "YelpTableViewCell.h"

NSString * const kYelpConsumerKey = @"vxKwwcR_NMQ7WaEiQBK_CA";
NSString * const kYelpConsumerSecret = @"33QCvh5bIF5jIHR5klQr7RtBDhQ";
NSString * const kYelpToken = @"uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV";
NSString * const kYelpTokenSecret = @"mqtKIxMIR4iBtBPZCmCLEb-Dz3Y";
@interface MainViewController () {
    UIView *networkErrorView;
    UILabel *networkErrorLabel;
    NSArray *restaurants;
}

- (void)fetchData:(id)sender;

@property (nonatomic, strong) YelpClient *client;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.client = [[YelpClient alloc] initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
        
        [self fetchData:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UISearchBar *searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0,200,200)];
    searchbar.delegate = self;
    [searchbar setBarTintColor:[UIColor redColor]];
    [searchbar setTintColor:[UIColor blackColor]];
    
    self.navigationItem.titleView = searchbar;
    
    
    UINib *CellNib = [UINib nibWithNibName:@"YelpTableViewCell" bundle:nil];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //self.tableView.estimatedRowHeight = 120;

    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:CellNib forCellReuseIdentifier:@"YelpTableViewCell"];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YelpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YelpTableViewCell" forIndexPath:indexPath];
    cell.restaurant = restaurants[indexPath.row];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return restaurants.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat result = 120;
    return result;
}


- (void) fetchData:(id)sender{
    [self.client searchWithTerm:@"Thai" success:^(AFHTTPRequestOperation *operation, id response) {
        restaurants = [Restaurant restaurantFromYelpDict:response[@"businesses"]];
        [self.tableView reloadData];
        NSLog(@"response is %@", restaurants);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [error description]);
    }];

}


@end
