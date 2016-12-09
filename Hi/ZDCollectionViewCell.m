//
//  ZDCollectionViewCell.m
//  Hi
//
//  Created by user_kevin on 16/11/29.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "ZDCollectionViewCell.h"

@interface ZDCollectionViewCell ()


@property(nonatomic,strong)UIImageView * showImageView;
@property(nonatomic,strong)UILabel * fansCount;
@property(nonatomic,strong)UIButton * addFriend;

@end

@implementation ZDCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _showImageView = [[UIImageView alloc]init];
        [self addSubview:_showImageView];
        
        _fansCount = [[UILabel alloc]init];
        _fansCount.font = [FontOutSystem fontWithFangZhengZhenSize:14.0];
        [self addSubview:_fansCount];
        
        _addFriend = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addFriend setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [self addSubview:_addFriend];
        [_addFriend addTarget:self action:@selector(addFriendAction:) forControlEvents:UIControlEventTouchUpInside];

        
    }
    return self;
}

-(void)setUsername_bmob:(NSDictionary *)username_bmob
{
    model_dic * userDic = [[model_dic alloc]initWithDictionary:username_bmob];
    
    [_showImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",userDic.headPhoto]]];
    _showImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    
    _addFriend.center = CGPointMake(self.frame.size.width-10-15, self.frame.size.width+(self.frame.size.height-self.frame.size.width)/2);
    _addFriend.bounds = CGRectMake(0, 0, 30, 30);
    
    _fansCount.frame = CGRectMake(10, self.frame.size.width, self.frame.size.width, self.frame.size.height-self.frame.size.width);
    _fansCount.text = [NSString stringWithFormat:@"粉丝：%@人",userDic.fansNumber];
    CGSize size_fans = [_fansCount.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_fansCount.font,NSFontAttributeName, nil]];
    
    if (size_fans.width>_addFriend.frame.origin.x-15) {
        size_fans.width = _addFriend.frame.origin.x-15;
    }
    
    _fansCount.frame = CGRectMake(10, self.frame.size.width+((self.frame.size.height-self.frame.size.width)/2)-size_fans.height/2, size_fans.width, size_fans.height);
}
- (void)addFriendAction:(UIButton *)sender
{
    /**
        添加关注
     */
}
@end
