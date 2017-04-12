//
//  MADetailViewController.m
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 4/2/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MADetailViewController.h"

@interface MADetailViewController ()

@end

@implementation MADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Setting the passed item name as detail view controller itemName 
    _itemName.text=_item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
