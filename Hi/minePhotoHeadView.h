//
//  minePhotoHeadView.h
//  Hi
//
//  Created by user_kevin on 16/11/25.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol minePhotoHeadViewDelegate <NSObject>

-(void)headViewTapGesture:(UITapGestureRecognizer *)gesture;

@end

@interface minePhotoHeadView : UIView

@property(nonatomic,strong)UIImageView * headImage;
@property(nonatomic,strong)UILabel * xingqu;
@property(nonatomic,strong)UILabel * dianying;
@property(nonatomic,strong)UILabel * shiwu;
@property(nonatomic,strong)UILabel * lvyou;

@property(nonatomic,weak)id<minePhotoHeadViewDelegate>delegate;

@end
