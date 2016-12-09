//
//  model_dic.m
//  Hi
//
//  Created by user_kevin on 16/12/9.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "model_dic.h"

@implementation model_dic

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        
        self.fansNumber = [NSString stringWithFormat:@"%@",dictionary[@"fansNumber"]];
        self.isFocus = [NSString stringWithFormat:@"%@",dictionary[@"isFocus"]];
        self.city = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"city"]];
        self.createdAt = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"createdAt"]];
        self.food = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"food"]];
        self.headPhoto = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"headPhoto"]];
        self.height = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"height"]];
        self.mobilePhoneNumber = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"mobilePhoneNumber"]];
        self.mobilePhoneNumberVerified = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"mobilePhoneNumberVerified"]];
        self.nickName = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"nickName"]];
        self.objectId = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"objectId"]];
        self.sex = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"sex"]];
        self.updatedAt = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"updatedAt"]];
        self.userIdentity = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"userIdentity"]];
        self.username = [NSString stringWithFormat:@"%@",dictionary[@"user"][@"username"]];
    }
    return self;
}

@end
