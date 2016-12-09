//
//  model_dic.h
//  Hi
//
//  Created by user_kevin on 16/12/9.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model_dic : NSObject

@property(nonatomic,assign)NSString * fansNumber;
@property(nonatomic,assign)NSString * isFocus;
@property(nonatomic,assign)NSString * user;
@property(nonatomic,assign)NSString * city;
@property(nonatomic,assign)NSString * createdAt;
@property(nonatomic,assign)NSString * food;
@property(nonatomic,assign)NSString * headPhoto;
@property(nonatomic,assign)NSString * height;
@property(nonatomic,assign)NSString * mobilePhoneNumber ;
@property(nonatomic,assign)NSString * mobilePhoneNumberVerified ;
@property(nonatomic,assign)NSString * nickName;
@property(nonatomic,assign)NSString * objectId;
@property(nonatomic,assign)NSString * sex;
@property(nonatomic,assign)NSString * updatedAt;
@property(nonatomic,assign)NSString * userIdentity;
@property(nonatomic,assign)NSString * username;

-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
