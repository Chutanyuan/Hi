//
//  friendVCTableViewCell.m
//  Hi
//
//  Created by user_kevin on 16/12/9.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "friendVCTableViewCell.h"

@implementation friendVCTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        _headImage.layer.cornerRadius = 5;
        _headImage.clipsToBounds = YES;
        
        [self addSubview:_headImage];
        
        _nickname = [[UILabel alloc]init];
        _nickname.font = [FontOutSystem fontWithFangZhengZhenSize:15.0];
        [self addSubview:_nickname];
        
    }
    return self;
}
-(void)setUserDic:(NSDictionary *)userDic
{
    [_headImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",userDic[@"headPhoto"]]]];
    _nickname.text = [NSString stringWithFormat:@"%@",userDic[@"nickName"]];
    CGSize size_nickname = [_nickname.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_nickname.font,NSFontAttributeName, nil]];
    _nickname.frame = CGRectMake(_headImage.frame.origin.x+_headImage.frame.size.width+10, _headImage.center.y-size_nickname.height/2, size_nickname.width, size_nickname.height);
    
}

@end
