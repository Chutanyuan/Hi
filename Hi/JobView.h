//
//  JobView.h
//  Hi
//
//  Created by user_kevin on 16/11/24.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JobViewDelegate <NSObject>

-(void)jobLabelText:(NSString *)text;

@end

@interface JobView : UIView
@property(nonatomic,strong)NSArray * jobArray;
@property(nonatomic,weak)id<JobViewDelegate>delegate;

@end
