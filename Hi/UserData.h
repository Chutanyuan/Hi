//
//  UserData.h
//  Hi
//
//  Created by user_kevin on 16/11/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

-(id)initUserAttribute:(NSDictionary *)dic;

/** 用户名－通常为手机号 */
@property(nonatomic,strong)NSString * username;
/** 昵称 */
@property(nonatomic,strong)NSString * nickname;
/** 性别 */
@property(nonatomic,strong)NSString * sex;
/** 年龄 */
@property(nonatomic,strong)NSString * age;
/** 头像 */
@property(nonatomic,strong)NSString * headerImage;
/** 签名 */
@property(nonatomic,strong)NSString * signer;
/** 身份 */
@property(nonatomic,strong)NSString * identity;

@end
