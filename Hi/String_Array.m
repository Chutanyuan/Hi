//
//  String_Array.m
//  Hi
//
//  Created by user_kevin on 16/12/9.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "String_Array.h"

@implementation String_Array

+(NSArray *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                   options:NSJSONReadingMutableContainers
                                                     error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


@end
