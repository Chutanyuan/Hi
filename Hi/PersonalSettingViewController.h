//
//  PersonalSettingViewController.h
//  Hi
//
//  Created by user_kevin on 16/11/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SettingType) {
    SettingTypeSpace    = 0,   //空白
    SettingTypeAvatar   = 1,
    SettingTypeNick     = 2,
    SettingTypeGender   = 3,
    SettingTypeFeedback = 4
};
@interface PersonalSettingViewController : UIViewController

@end
