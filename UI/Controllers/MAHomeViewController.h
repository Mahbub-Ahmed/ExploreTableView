//
//  MAHomeViewController.h
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 4/1/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

//UITableView delegate & dataSource Included
@interface MAHomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//Table view 
@property (strong, nonatomic) IBOutlet UITableView *itemTable;

@end
