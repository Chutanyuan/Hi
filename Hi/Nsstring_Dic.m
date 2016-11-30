//
//  Nsstring_Dic.m
//  Hi
//
//  Created by user_kevin on 16/11/29.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "Nsstring_Dic.h"

@implementation Nsstring_Dic

+(NSDictionary *)JsonStringToDictionary:(NSString *)jsonString
{
    NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    return jsonDic;
}

@end
