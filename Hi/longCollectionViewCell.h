//
//  longCollectionViewCell.h
//  Hi
//
//  Created by user_kevin on 16/11/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol longClooectionViewCellDelegate <NSObject>

-(void)removeFocusSuccess:(UIButton *)sender;

@end

@interface longCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong)NSDictionary * username_bmob;
@property(nonatomic,weak)id<longClooectionViewCellDelegate>delegate;


@end
