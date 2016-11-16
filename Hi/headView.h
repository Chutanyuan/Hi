//
//  headView.h
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol headTableViewAction <NSObject>

- (void)didSelectRowAtIndexPath:(NSInteger)row;

@end

@interface headView : UIView

@property(nonatomic,weak)id<headTableViewAction>delegate;

@end
