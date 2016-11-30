//
//  adressView.h
//  Hi
//
//  Created by user_kevin on 16/11/29.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol adressViewDelegate <NSObject>

-(void)adressLabelText:(NSString *)text;

@end

@interface adressView : UIView

@property(nonatomic,strong)NSArray * adressArray;
@property(nonatomic,weak)id<adressViewDelegate>delegate;


@end
