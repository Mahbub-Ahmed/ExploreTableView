//
//  MATableVIewHeaderCell.m
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 4/1/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MATableVIewHeaderCell.h"

@implementation MATableVIewHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //Adding image border and rounding the corner
    _sectionImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _sectionImage.layer.borderWidth = .7;
    
    _sectionImage.layer.cornerRadius = 5.0f;
    _sectionImage.layer.masksToBounds = YES;
}


@end
