//
//  longCollectionViewCell.m
//  Hi
//
//  Created by user_kevin on 16/11/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "longCollectionViewCell.h"

@interface longCollectionViewCell ()


@property(nonatomic,strong)UIImageView * showImageView;
@property(nonatomic,strong)UILabel * fansCount;
@property(nonatomic,strong)UIImageView * addFriend;
@property(nonatomic,strong)UIView * centerLine;

@property(nonatomic,strong)UILabel * identity;
@property(nonatomic,strong)UILabel * address;
@property(nonatomic,strong)UILabel * heightOfPerson;

@end

@implementation longCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _showImageView = [[UIImageView alloc]init];
        [self addSubview:_showImageView];
        
        _fansCount = [[UILabel alloc]init];
        _fansCount.font = [FontOutSystem fontWithFangZhengZhenSize:14.0];
        [self addSubview:_fansCount];
        
        _addFriend = [[UIImageView alloc]init];
        [self addSubview:_addFriend];
        
        _centerLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, 1)];
        _centerLine.backgroundColor = [CorlorTransform colorWithHexString:@"#BABABA"];
        [self addSubview:_centerLine];

    
        _identity = [[UILabel alloc]init];
        _identity.font = [FontOutSystem fontWithFangZhengZhenSize:16.0];
        _identity.textAlignment = NSTextAlignmentCenter;
        _identity.layer.cornerRadius = 5;
        _identity.layer.borderColor = [CorlorTransform colorWithHexString:@"BBBBBB"].CGColor;
        _identity.layer.borderWidth = 1;
        _identity.clipsToBounds = YES;
        [self addSubview:_identity];

        _address = [[UILabel alloc]init];
        _address.font = [FontOutSystem fontWithFangZhengZhenSize:16.0];
        _address.textAlignment = NSTextAlignmentCenter;
        _address.layer.cornerRadius = 5;
        _address.layer.borderColor = [CorlorTransform colorWithHexString:@"BBBBBB"].CGColor;
        _address.layer.borderWidth = 1;
        _address.clipsToBounds = YES;
        [self addSubview:_address];

        _heightOfPerson = [[UILabel alloc]init];
        _heightOfPerson.font = [FontOutSystem fontWithFangZhengZhenSize:16.0];
        _heightOfPerson.textAlignment = NSTextAlignmentCenter;
        _heightOfPerson.layer.cornerRadius = 5;
        _heightOfPerson.layer.borderColor = [CorlorTransform colorWithHexString:@"BBBBBB"].CGColor;
        _heightOfPerson.layer.borderWidth = 1;
        _heightOfPerson.clipsToBounds = YES;
        [self addSubview:_heightOfPerson];
        

    }
    return self;
}

-(void)setUsername_bmob:(BmobUser *)username_bmob
{
    NSLog(@"%@",username_bmob);
    
    
    [_showImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[username_bmob objectForKey:@"avatar"]]]];
    _showImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    
    _addFriend.center = CGPointMake(self.frame.size.width-10-15, self.frame.size.width+(self.frame.size.height/2-self.frame.size.width)/2);
    _addFriend.bounds = CGRectMake(0, 0, 30, 30);
    _addFriend.backgroundColor = [UIColor blackColor];
    
    _fansCount.frame = CGRectMake(10, self.frame.size.width, self.frame.size.width, self.frame.size.height/2-self.frame.size.width);
    BmobQuery * query = [BmobQuery queryWithClassName:@"_User"];

    [query getObjectInBackgroundWithId:[NSString stringWithFormat:@"%@",[username_bmob objectForKey:@"objectId"]] block:^(BmobObject *object, NSError *error) {
        if (!error) {
            
            NSArray * fansArray = [object objectForKey:@"fans"];
            
            _fansCount.text = [NSString stringWithFormat:@"粉丝：%ld人",fansArray.count];
            CGSize size_fans = [_fansCount.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_fansCount.font,NSFontAttributeName, nil]];
            
            if (size_fans.width>_addFriend.frame.origin.x-15) {
                size_fans.width = _addFriend.frame.origin.x-15;
            }
            
            _fansCount.frame = CGRectMake(10, self.frame.size.width+((self.frame.size.height/2-self.frame.size.width)/2)-size_fans.height/2, size_fans.width, size_fans.height);
            
            _identity.text = [object objectForKey:@"userIdentity"];

            NSLog(@"+++++++++++++++++++++++++++++++++++++++%@",_identity.text);
            if (_identity.text.length<1) {
                _identity.text = @"---skd[-adk[s";
            }
            
            _identity.text = [object objectForKey:@"userIdentity"];
            CGSize size_Identity = [_identity.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_identity.font,NSFontAttributeName, nil]];
            _identity.frame = CGRectMake(10, _centerLine.frame.origin.y+11, self.frame.size.width-20, size_Identity.height+10);
            
        }else{
            
        }
    }];
    
    
}
@end
