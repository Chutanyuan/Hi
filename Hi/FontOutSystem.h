//
//  FontOutSystem.h
//  MeiWan
//
//  Created by user_kevin on 16/10/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FontOutSystem : NSObject

/** 微信字体华文黑体*/
+(UIFont *)fontWithFangZhengSize:(CGFloat)fontSize;
/** 微信字体华文黑体加粗*/
+(UIFont *)fontWithFangZhengSizeBold:(CGFloat)fontSize;
/** 微信字体方正中等线*/
+(UIFont *)fontWithFangZhengZhenSize:(CGFloat)fontSize;

@end
