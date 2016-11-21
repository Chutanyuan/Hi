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
@property(nonatomic,strong)UIView * grayview;

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
        _contentText.text = @"嗨，我是客服月儿嗨，我是客服月儿嗨，我是客服月儿嗨，我是客服月儿嗨，我是客服月儿嗨，我是客服月儿。";
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
        
        _ZanOrPinglun = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ZanOrPinglun setImage:[UIImage imageNamed:@"AlbumOperateMore"] forState:UIControlStateNormal];
        _ZanOrPinglun.center = CGPointMake(screenwidth-45, _timeWithNow.center.y);
        _ZanOrPinglun.bounds = CGRectMake(0, 0, 25, 25);
        [_ZanOrPinglun addTarget:self action:@selector(zanAndPinglun:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_ZanOrPinglun];
        
        
        _grayview = [[UIView alloc]init];
        _grayview.frame = CGRectMake(_ZanOrPinglun.frame.origin.x, _timeWithNow.frame.origin.y-5, 0, 30);
        _grayview.backgroundColor = [CorlorTransform colorWithHexString:@"#464C50"];
        _grayview.layer.cornerRadius = 5;
        _grayview.clipsToBounds = YES;
        [self addSubview:_grayview];

        
    }
    return self;
}


- (void)zanAndPinglun:(UIButton *)sender
{
    static int i = 0;
    i++;
    if (i%2==1) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _grayview.frame;
            _grayview.frame = CGRectMake(frame.origin.x-120, frame.origin.y , 120, 30);
        }completion:^(BOOL finished) {
            if (finished==YES) {
                
                static dispatch_once_t onceToken;
                dispatch_once(&onceToken, ^{
                    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(_grayview.frame.size.width/2, 4, 1, _grayview.frame.size.height-8)];
                    line.backgroundColor = [CorlorTransform colorWithHexString:@"#000000"];
                    [_grayview addSubview:line];
                    
                    UIButton * zan = [UIButton buttonWithType:UIButtonTypeCustom];
                    zan.frame = CGRectMake(0, 0, 60, 30);
                    [zan setImage:[UIImage imageNamed:@"AlbumLike"] forState:UIControlStateNormal];
                    [zan setTitle:@"赞" forState:UIControlStateNormal];
                    zan.titleLabel.font = [FontOutSystem fontWithFangZhengSize:10.0];
                    [zan addTarget:self action:@selector(zanAndPinglunTouch:) forControlEvents:UIControlEventTouchUpInside];
                    [_grayview addSubview:zan];
                    
                    UIButton * pinglun = [UIButton buttonWithType:UIButtonTypeCustom];
                    [pinglun setTitle:@"评论" forState:UIControlStateNormal];
                    [pinglun setImage:[UIImage imageNamed:@"AlbumComment"] forState:UIControlStateNormal];
                    pinglun.titleLabel.font = [FontOutSystem fontWithFangZhengSize:10.0];
                    pinglun.frame = CGRectMake(60, 0, 60, 30);
                    [pinglun addTarget:self action:@selector(zanAndPinglunTouch:) forControlEvents:UIControlEventTouchUpInside];
                    [_grayview addSubview:pinglun];
                });
                
            }else{
                NSLog(@"不知道什么梗");
            }
        }];

    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            _grayview.frame = CGRectMake(_ZanOrPinglun.frame.origin.x, _timeWithNow.frame.origin.y-5, 0, 30);
        }];
        
    }
}

- (void)zanAndPinglunTouch:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"赞"]) {
        [sender setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
        
    }
    if ([sender.titleLabel.text isEqualToString:@"评论"]) {
        
    }
    [UIView animateWithDuration:0.3 animations:^{
        _grayview.frame = CGRectMake(_ZanOrPinglun.frame.origin.x, _timeWithNow.frame.origin.y-5, 0, 30);
    }];

}
@end
