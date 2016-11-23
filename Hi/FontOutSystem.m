//
//  FontOutSystem.m
//  MeiWan
//
//  Created by user_kevin on 16/10/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FontOutSystem.h"

@implementation FontOutSystem

/** 微信字体华文黑体*/
+(UIFont *)fontWithFangZhengSize:(CGFloat)fontSize
{
    UIFont * font = [[UIFont alloc]init];
//    font = [UIFont fontWithName:@"Heiti SC" size:fontSize];
    font = [UIFont systemFontOfSize:fontSize];
    return font;
}
/** 微信字体华文黑体加粗*/
+(UIFont *)fontWithFangZhengSizeBold:(CGFloat)fontSize
{
    UIFont * font = [[UIFont alloc]init];
    font = [UIFont fontWithName:@"Heiti TC" size:fontSize];
    return font;
}
/** 微信字体方正中等线*/
+(UIFont *)fontWithFangZhengZhenSize:(CGFloat)fontSize
{
    UIFont * font = [[UIFont alloc]init];
    font = [UIFont fontWithName:@"FZZhongDengXian-Z07S" size:fontSize];
    return font;
}

@end
