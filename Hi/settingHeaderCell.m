//
//  settingHeaderCell.m
//  Hi
//
//  Created by user_kevin on 16/11/24.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "settingHeaderCell.h"

@implementation settingHeaderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(screenwidth-10-80, 10, 80, 80)];
        imageview.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        imageview.layer.cornerRadius = 5;
        imageview.clipsToBounds = YES;
        [self addSubview:imageview];
        self.imageview = imageview;
        CGRect frame = self.frame;
        frame.size.height = imageview.frame.size.height+20;
        self.frame = frame;
        
    }
    return self;
}

@end
