//
//  chooseSexView.h
//  Hi
//
//  Created by user_kevin on 16/11/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol chooseSexDelegate <NSObject>

/** sexChoose */
- (void)sexChooseSure:(UIButton *)sender;

@end

@interface chooseSexView : UIView

@property(nonatomic,strong) UIButton * woman;
@property(nonatomic,strong) UIButton * man;

@property(nonatomic,weak)id<chooseSexDelegate>delegate;

@end
