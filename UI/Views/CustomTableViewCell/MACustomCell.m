//
//  MACustomCell.m
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 4/1/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MACustomCell.h"

@implementation MACustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //Adding outerVIew border, setting border color and rounding the border corners
    _outerVIew.layer.borderWidth = 2.0f;
    _outerVIew.layer.borderColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1.0f].CGColor;
    _outerVIew.layer.cornerRadius = 10.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
