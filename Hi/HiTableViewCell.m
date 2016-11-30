//
//  HiTableViewCell.m
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "HiTableViewCell.h"

@interface HiTableViewCell ()

@end

@implementation HiTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
        _headerImage.layer.cornerRadius = 5;
        _headerImage.clipsToBounds = YES;
        _headerImage.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_headerImage];
        
        _nickname = [[UILabel alloc]init];
        _nickname.text = @"一青云";
        CGSize size_nickname = [_nickname.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_nickname.font,NSFontAttributeName, nil]];
        _nickname.frame = CGRectMake(_headerImage.frame.size.width+_headerImage.frame.origin.x+10, _headerImage.frame.origin.y, size_nickname.width, size_nickname.height);
        [self addSubview:_nickname];
        
        _lastDialogue = [[UILabel alloc]init];
        _lastDialogue.text = @"好的谢谢了亲好的谢谢了亲好的谢谢了亲好的谢谢了亲好的谢谢了亲";
        _lastDialogue.font = [FontOutSystem fontWithFangZhengSize:17.0];
        _lastDialogue.textColor = [CorlorTransform colorWithHexString:@"#949494"];
        CGSize size_lastDialogue = [_lastDialogue.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_lastDialogue.font,NSFontAttributeName, nil]];
        
        float width_lastDialogue = screenwidth-_nickname.frame.origin.x-10;
        if (size_lastDialogue.width>width_lastDialogue) {
            size_lastDialogue.width = width_lastDialogue;
        }
        _lastDialogue.frame = CGRectMake(_headerImage.frame.size.width+_headerImage.frame.origin.x+10, _headerImage.frame.size.height-size_lastDialogue.height, size_lastDialogue.width, size_lastDialogue.height);
        [self addSubview:_lastDialogue];
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 59, screenwidth, 1)];
        view.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:view];
        
    }
    return self;
}

@end
