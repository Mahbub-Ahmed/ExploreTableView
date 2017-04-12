//
//  MACustomCell.h
//  CustomTableApp
//
//  Created by Mahbub Ahmed on 4/1/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MACustomCell : UITableViewCell

//Outlet for Outer view
@property (strong, nonatomic) IBOutlet UIView *outerVIew;

//Outlet for item image
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;

//Outlet for item name
@property (strong, nonatomic) IBOutlet UILabel *itemName;

@end
