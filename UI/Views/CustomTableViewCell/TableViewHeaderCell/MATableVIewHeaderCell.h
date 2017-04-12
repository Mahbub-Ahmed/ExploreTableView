//
//  MATableVIewHeaderCell.h
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 4/1/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MATableVIewHeaderCell : UITableViewHeaderFooterView

//Section Header Title
@property (strong, nonatomic) IBOutlet UILabel *sectionTitle;

//Section Header image
@property (strong, nonatomic) IBOutlet UIImageView *sectionImage;

@end
