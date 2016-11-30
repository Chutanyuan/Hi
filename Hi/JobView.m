//
//  JobView.m
//  Hi
//
//  Created by user_kevin on 16/11/24.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "JobView.h"

@interface JobView ()
{
    NSString * jiluText;
    NSTimer * timer;
    UILabel * titlelabel;
    int i;
}
@end

@implementation JobView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIView * topline = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, 1)];
        topline.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:topline];
        
        UIView * centerline = [[UIView alloc]initWithFrame:CGRectMake(0, 260, screenwidth, 1)];
        centerline.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:centerline];
       
        UIView * bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, centerline.frame.origin.y+45, screenwidth, 1)];
        bottomLine.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:bottomLine];
        
        UIButton * cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel setTitleColor:[CorlorTransform colorWithHexString:@"#FF0000"] forState:UIControlStateNormal];
        cancel.frame = CGRectMake(0, centerline.frame.origin.y+1, screenwidth/2-0.5, 44);
        cancel.titleLabel.font = [FontOutSystem fontWithFangZhengSize:15.0];
        cancel.tag = 0;
        [cancel addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancel];
        UIView * rightOnButton = [[UIView alloc]initWithFrame:CGRectMake(cancel.frame.size.width, centerline.frame.origin.y, 1, 45)];
        rightOnButton.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:rightOnButton];
        UIButton * sure = [UIButton buttonWithType:UIButtonTypeCustom];
        [sure setTitleColor:[CorlorTransform colorWithHexString:@"#76F084"] forState:UIControlStateNormal];
        [sure setTitle:@"确定" forState:UIControlStateNormal];
        sure.titleLabel.font = [FontOutSystem fontWithFangZhengSize:15.0];
        sure.frame = CGRectMake(rightOnButton.frame.origin.x+1, cancel.frame.origin.y, cancel.frame.size.width, cancel.frame.size.height);
        sure.tag = 2;
        [sure addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sure];
        
    }
    return self;
}
- (void)buttonClick:(UIButton *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
       self.frame =CGRectMake(screenwidth, 0, screenwidth, 0);
    }];
    if (sender.tag==2) {
        NSLog(@"%@",titlelabel.text);
        titlelabel.layer.borderColor = [CorlorTransform colorWithHexString:@"#BABABA"].CGColor;
        [self.delegate jobLabelText:titlelabel.text];
    }
}
-(void)setJobArray:(NSArray *)jobArray
{
    
    double lineNumber = jobArray.count/4.0;
    int line = ceil(lineNumber);

    [jobArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        BmobObject * objectBM = obj;

        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10+idx%4*((screenwidth-50)/4+10), 10+idx/(line)*50,(screenwidth-50)/4, 40)];
        label.numberOfLines = 0;
        label.text = [NSString stringWithFormat:@"%@",[objectBM objectForKey:@"typeName"]];
        if ([label.text isEqualToString:@"自定义"]) {
            label.textColor = [CorlorTransform colorWithHexString:@"#400EEF"];
        }
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [FontOutSystem fontWithFangZhengSize:15.0];
        label.layer.cornerRadius = 5;
        label.layer.borderColor = [CorlorTransform colorWithHexString:@"#BABABA"].CGColor;
        label.layer.borderWidth = 1;
        label.clipsToBounds = YES;
        label.tag = idx;
        UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(LabelTouch:)];
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:gesture];
        
        [self addSubview:label];

        
    }];
}
- (void)LabelTouch:(UITapGestureRecognizer *)gesture
{
    titlelabel = (UILabel *)[gesture view];
    titlelabel.layer.borderColor = [CorlorTransform colorWithHexString:@"#48FA8D"].CGColor;
    
}

@end
