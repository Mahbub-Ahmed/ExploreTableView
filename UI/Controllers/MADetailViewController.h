//
//  MADetailViewController.h
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 4/2/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADetailViewController : UIViewController

//Outlet for item
@property (strong, nonatomic) IBOutlet UILabel *itemName;

//Property to recive the item name passed by homeViewController
@property (strong, nonatomic) NSString *item;

@end
