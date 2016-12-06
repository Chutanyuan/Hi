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
@property(nonatomic,strong)UIImageView * addFriend;

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
        
        _addFriend = [[UIImageView alloc]init];
        [self addSubview:_addFriend];
        
    }
    return self;
}

-(void)setUsername_bmob:(BmobUser *)username_bmob
{

    [_showImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[username_bmob objectForKey:@"headPhoto"]]]];
    _showImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    
    _addFriend.center = CGPointMake(self.frame.size.width-10-15, self.frame.size.width+(self.frame.size.height-self.frame.size.width)/2);
    _addFriend.bounds = CGRectMake(0, 0, 30, 30);
    _addFriend.backgroundColor = [UIColor blackColor];
    
    _fansCount.frame = CGRectMake(10, self.frame.size.width, self.frame.size.width, self.frame.size.height-self.frame.size.width);
    BmobQuery * query = [BmobQuery queryWithClassName:@"_User"];
    [query selectKeys:@[@"username",@"fans"]];
    [query getObjectInBackgroundWithId:[NSString stringWithFormat:@"%@",[username_bmob objectForKey:@"objectId"]] block:^(BmobObject *object, NSError *error) {
        if (!error) {
           
            NSArray * fansArray = [object objectForKey:@"fans"];
            
            _fansCount.text = [NSString stringWithFormat:@"粉丝：%ld人",fansArray.count];
            CGSize size_fans = [_fansCount.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_fansCount.font,NSFontAttributeName, nil]];
            
            if (size_fans.width>_addFriend.frame.origin.x-15) {
                size_fans.width = _addFriend.frame.origin.x-15;
            }
            
            _fansCount.frame = CGRectMake(10, self.frame.size.width+((self.frame.size.height-self.frame.size.width)/2)-size_fans.height/2, size_fans.width, size_fans.height);
            
        }else{

        }
    }];

}
@end
