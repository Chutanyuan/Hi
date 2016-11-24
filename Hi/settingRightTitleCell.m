//
//  settingRightTitleCell.m
//  Hi
//
//  Created by user_kevin on 16/11/24.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "settingRightTitleCell.h"

@implementation settingRightTitleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel * label = [[UILabel alloc]init];
        label.text = @"未设置";
        label.font = [FontOutSystem fontWithFangZhengSize:15.0];
        CGSize size = [label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName, nil]];
        label.frame = CGRectMake(screenwidth-10-screenwidth/2, self.frame.size.height/2-size.height/2, screenwidth/2, size.height);
        label.textAlignment = NSTextAlignmentRight;
        [self addSubview:label];
        self.label = label;

    }
    return self;
}

@end
