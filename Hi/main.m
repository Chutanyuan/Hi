//
//  main.m
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSString *appKey = @"08451d1f1c6233dc30a91387bf34f54a";
        [Bmob registerWithAppKey:appKey];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
