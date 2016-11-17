//
//  newEventsTableViewCell.m
//  Hi
//
//  Created by user_kevin on 16/11/17.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "newEventsTableViewCell.h"

@interface newEventsTableViewCell ()

@property(nonatomic,strong)UIImageView * headerImage;
@property(nonatomic,strong)UILabel * nickname;
@property(nonatomic,strong)UILabel * contentText;
@property(nonatomic,strong)UIImageView * contentImage;
@property(nonatomic,strong)UILabel * timeWithNow;
@property(nonatomic,strong)UIButton * ZanOrPinglun;

@end

@implementation newEventsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 45, 45)];
        _headerImage.layer.cornerRadius = 3;
        _headerImage.clipsToBounds = YES;
        _headerImage.image = [UIImage imageNamed:@"3"];
        [self addSubview:_headerImage];
        
        _nickname = [[UILabel alloc]init];
        _nickname.text = @"小月儿";
        _nickname.textColor = [CorlorTransform colorWithHexString:@"#5F5FA9"];
        _nickname.font = [FontOutSystem fontWithFangZhengSize:13.0];
        CGSize size_nickname = [_nickname.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_nickname.font,NSFontAttributeName, nil]];
        _nickname.frame = CGRectMake(_headerImage.frame.size.width+_headerImage.frame.origin.x+10, _headerImage.frame.origin.y, size_nickname.width, size_nickname.height);
        
        [self addSubview:_nickname];
        
        _contentText = [[UILabel alloc]init];
        _contentText.text = @"嗨，我是客服月儿。";
        _contentText.numberOfLines = 0;
        _contentText.font = [FontOutSystem fontWithFangZhengSize:13.0];
        CGSize size_contentText = [_contentText.text boundingRectWithSize:CGSizeMake(screenwidth-_nickname.frame.origin.x-_headerImage.frame.size.width+20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:_contentText.font,NSFontAttributeName, nil] context:nil].size;
        _contentText.frame = CGRectMake(_nickname.frame.origin.x, size_nickname.height+_nickname.frame.origin.y+10, size_contentText.width, size_contentText.height);
        [self addSubview:_contentText];
        
        CGRect frame = self.frame;
        if (_contentText.frame.origin.y+size_contentText.height>_headerImage.frame.origin.y+_headerImage.frame.size.height) {
            frame.size.height = _contentText.frame.origin.y+10+_contentText.frame.size.height;
        }else{
            frame.size.height = _headerImage.frame.origin.y*2+_headerImage.frame.size.height;
        }
        self.frame = frame;
        
        _contentImage = [[UIImageView alloc]init];
        _contentImage.frame = CGRectMake(_contentText.frame.origin.x, _contentText.frame.origin.y+10+size_contentText.height, screenwidth-_nickname.frame.origin.x-_headerImage.frame.size.width+20, (screenwidth-_nickname.frame.origin.x-_headerImage.frame.size.width+20)/4*3);
        _contentImage.contentMode = UIViewContentModeScaleAspectFill;
        _contentImage.clipsToBounds = YES;
        _contentImage.image = [UIImage imageNamed:@"5"];
        [self addSubview:_contentImage];
        CGRect frame1 = self.frame;
        frame1.size.height = _contentImage.frame.origin.y+_contentImage.frame.size.height+10+30;
        self.frame = frame1;
        
        _timeWithNow = [[UILabel alloc]init];
        _timeWithNow.text = @"1分钟前";
        _timeWithNow.font = [FontOutSystem fontWithFangZhengSize:10.0];
        _timeWithNow.textColor = [CorlorTransform colorWithHexString:@"#BEBDBE"];
        CGSize size_timeWithNow = [_timeWithNow.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_timeWithNow.font,NSFontAttributeName, nil]];
        _timeWithNow.frame = CGRectMake(_nickname.frame.origin.x, _contentImage.frame.origin.y+_contentImage.frame.size.height+10, size_timeWithNow.width, size_timeWithNow.height);
        [self addSubview:_timeWithNow];
        
    }
    return self;
}

@end
