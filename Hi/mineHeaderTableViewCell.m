//
//  mineHeaderTableViewCell.m
//  Hi
//
//  Created by user_kevin on 16/11/18.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "mineHeaderTableViewCell.h"
#import <BmobSDK/Bmob.h>

@interface mineHeaderTableViewCell ()

@property(nonatomic,strong)UIImageView * headImage;
@property(nonatomic,strong)UILabel * nickname;
@property(nonatomic,strong)UILabel * phoneNumber;

@end

@implementation mineHeaderTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        BmobUser * user = [BmobUser currentUser];
        NSDictionary * data = [user requestDataDictionary];
        UserData * userdata = [[UserData alloc]initUserAttribute:data];
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
        [_headImage sd_setImageWithURL:[NSURL URLWithString:[user objectForKey:@"headPhoto"]] placeholderImage:nil];
        [self addSubview:_headImage];
        
        _nickname = [[UILabel alloc]init];
        _nickname.font = [FontOutSystem fontWithFangZhengSize:15.0];
        if ([[user objectForKey:@"nickName"] isEqualToString:@""]) {
            _nickname.text = [NSString stringWithFormat:@"未设置"];

        }else{
            _nickname.text = [NSString stringWithFormat:@"%@",[user objectForKey:@"nickName"]];
        }
        CGSize size_nickname = [_nickname.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_nickname.font,NSFontAttributeName, nil]];
        _nickname.frame = CGRectMake(_headImage.frame.origin.x+_headImage.frame.size.width+10, _headImage.frame.origin.y+10, size_nickname.width, size_nickname.height);
        [self addSubview:_nickname];
        
        _phoneNumber = [[UILabel alloc]init];
        _phoneNumber.text = [NSString stringWithFormat:@"手机号:%@",userdata.username];
        _phoneNumber.font = [FontOutSystem fontWithFangZhengSize:15.0];
        CGSize size_phoneNumber = [_phoneNumber.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_phoneNumber.font,NSFontAttributeName, nil]];
        _phoneNumber.frame = CGRectMake(_nickname.frame.origin.x, _headImage.frame.size.height+_headImage.frame.origin.y-size_nickname.height-10, size_phoneNumber.width, size_phoneNumber.height);
        [self addSubview:_phoneNumber];
        
        CGRect frame = self.frame;
        frame.size.height = _headImage.frame.size.height+20;
        self.frame = frame;
        
    }
    return self;
}
@end
