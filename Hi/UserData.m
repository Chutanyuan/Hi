//
//  UserData.m
//  Hi
//
//  Created by user_kevin on 16/11/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "UserData.h"

@implementation UserData

-(id)initUserAttribute:(NSDictionary *)dic
{
    if (self = [super init]) {
        _username = dic[@"username"];
        _nickname = dic[@"nickname"];
        _sex = [NSString stringWithFormat:@"%@",dic[@"sex"]];
        _age = dic[@"age"];
        _signer = dic[@"signer"];
        _identity = dic[@"identity"];
        _headerImage = dic[@"headerImage"];
    }
    return self;
}

@end
