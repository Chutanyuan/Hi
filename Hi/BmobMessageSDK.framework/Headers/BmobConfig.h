//
//  BmobConfig.h
//  BmobMessageSDK
//
//  Created by Bmob on 16/10/25.
//  Copyright © 2016年 Bmob. All rights reserved.
//

#ifndef BmobConfig_h
#define BmobConfig_h


typedef void (^BmobBooleanResultBlock) (BOOL isSuccessful, NSError *error);
typedef void (^BmobIntegerResultBlock)(id msgId, NSError *error) ;
typedef void (^BmobQuerySMSCodeStateResultBlock)(NSDictionary *dic,NSError *error);

#endif /* BmobConfig_h */
