//
//  minePhotoHeadView.m
//  Hi
//
//  Created by user_kevin on 16/11/25.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "minePhotoHeadView.h"

@implementation minePhotoHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [CorlorTransform colorWithHexString:@"#37383D"];
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 30, screenwidth-60, frame.size.height-30-148)];
        BmobUser * user = [BmobUser currentUser];
        _headImage.contentMode = UIViewContentModeScaleAspectFill;
        _headImage.clipsToBounds = YES;
        [_headImage sd_setImageWithURL:[NSURL URLWithString:[user objectForKey:@"headPhoto"]] placeholderImage:nil];
        _headImage.layer.cornerRadius = 5;
        _headImage.clipsToBounds = YES;
        UITapGestureRecognizer * tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        _headImage.userInteractionEnabled = YES;
        [_headImage addGestureRecognizer:tapgesture];
        [self addSubview:_headImage];
        
        _xingqu = [[UILabel alloc]initWithFrame:CGRectMake(30, _headImage.frame.origin.y+_headImage.frame.size.height+30, (_headImage.frame.size.width-10)/2, 40)];
        _xingqu.text = @"兴趣";
        _xingqu.textAlignment = NSTextAlignmentCenter;
        _xingqu.font = [FontOutSystem fontWithFangZhengSize:13.0];
        _xingqu.layer.cornerRadius = 5;
        _xingqu.clipsToBounds = YES;
        _xingqu.backgroundColor = [CorlorTransform colorWithHexString:@"#F2F3F5"];
        [self addSubview:_xingqu];
        
        _dianying = [[UILabel alloc]initWithFrame:CGRectMake(_xingqu.frame.origin.x+_xingqu.frame.size.width+10, _xingqu.frame.origin.y, _xingqu.frame.size.width, _xingqu.frame.size.height)];
        _dianying.text = @"电影";
        _dianying.textAlignment = NSTextAlignmentCenter;
        _dianying.font = [FontOutSystem fontWithFangZhengSize:13.0];
        _dianying.layer.cornerRadius = 5;
        _dianying.clipsToBounds = YES;
        _dianying.backgroundColor = [CorlorTransform colorWithHexString:@"#F2F3F5"];
        [self addSubview:_dianying];
        
        _shiwu = [[UILabel alloc]initWithFrame:CGRectMake(_xingqu.frame.origin.x, _xingqu.frame.origin.y+_xingqu.frame.size.height+15, _xingqu.frame.size.width, _xingqu.frame.size.height)];
        _shiwu.text = @"食物";
        _shiwu.textAlignment = NSTextAlignmentCenter;
        _shiwu.font = [FontOutSystem fontWithFangZhengSize:13.0];
        _shiwu.layer.cornerRadius = 5;
        _shiwu.clipsToBounds = YES;
        _shiwu.backgroundColor = [CorlorTransform colorWithHexString:@"#F2F3F5"];
        [self addSubview:_shiwu];
        
        _lvyou = [[UILabel alloc]initWithFrame:CGRectMake(_shiwu.frame.origin.x+_shiwu.frame.size.width+10, _shiwu.frame.origin.y, _shiwu.frame.size.width, _shiwu.frame.size.height)];
        _lvyou.backgroundColor = _shiwu.backgroundColor;
        _lvyou.layer.cornerRadius = 5;
        _lvyou.clipsToBounds = YES;
        _lvyou.text = @"旅游";
        _lvyou.font = [FontOutSystem fontWithFangZhengSize:13.0];
        _lvyou.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lvyou];
        
        
    }
    return self;
}

- (void)tapGesture:(UITapGestureRecognizer *)gesture
{
    [self.delegate headViewTapGesture:gesture];
}

@end
