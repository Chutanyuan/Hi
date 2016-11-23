//
//  chooseSexView.m
//  Hi
//
//  Created by user_kevin on 16/11/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "chooseSexView.h"

@implementation chooseSexView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        UIView * topline = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, 1)];
        topline.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:topline];
        
        UIView * bottomline = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, screenwidth-1, 1)];
        bottomline.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:bottomline];
        
        
        UILabel * label = [[UILabel alloc]init];
        label.text = @"首先请选择您的性别\n一旦确定！！！\n永久不可更改";
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        CGSize size = CGSizeMake(screenwidth, 1000);

        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
        CGSize size_label = [label.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName, nil] context:nil].size;
        label.frame = CGRectMake(0, 20, screenwidth, size_label.height);
        [self addSubview:label];
        
        UIView * lineOnButton = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-46, screenwidth, 1)];
        lineOnButton.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:lineOnButton];
        
        UIButton * cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel setTitleColor:[CorlorTransform colorWithHexString:@"#555555"] forState:UIControlStateNormal];
        cancel.frame = CGRectMake(0, lineOnButton.frame.origin.y+1, screenwidth/2-0.5, 44);
        cancel.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
        cancel.tag = 0;
        [cancel addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancel];
        UIView * rightOnButton = [[UIView alloc]initWithFrame:CGRectMake(cancel.frame.size.width, lineOnButton.frame.origin.y, 1, 45)];
        rightOnButton.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self addSubview:rightOnButton];
        UIButton * sure = [UIButton buttonWithType:UIButtonTypeCustom];
        [sure setTitleColor:[CorlorTransform colorWithHexString:@"#555555"] forState:UIControlStateNormal];
        [sure setTitle:@"确定" forState:UIControlStateNormal];
        sure.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
        sure.frame = CGRectMake(rightOnButton.frame.origin.x+1, cancel.frame.origin.y, cancel.frame.size.width, cancel.frame.size.height);
        sure.tag = 2;
        [sure addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sure];
        
        UIButton * woman = [UIButton buttonWithType:UIButtonTypeCustom];
        [woman setTitle:@"女" forState:UIControlStateNormal];
        [woman setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        woman.titleLabel.font = cancel.titleLabel.font;
        [woman setBackgroundColor:[CorlorTransform colorWithHexString:@"#F93B33"]];
        woman.frame = CGRectMake(60, label.frame.origin.y+label.frame.size.height+20, (screenwidth-120)/2-10, 40);
        woman.layer.cornerRadius = 5;
        woman.clipsToBounds = YES;
        [woman addTarget:self action:@selector(sexChoose:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:woman];
        self.woman = woman;
        
        UIButton * man = [UIButton buttonWithType:UIButtonTypeCustom];
        [man setTitle:@"男" forState:UIControlStateNormal];
        [man setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        man.titleLabel.font = cancel.titleLabel.font;
        [man setBackgroundColor:[CorlorTransform colorWithHexString:@"#575AB1"]];
        man.frame = CGRectMake(woman.frame.origin.x+woman.frame.size.width+10, woman.frame.origin.y, woman.frame.size.width, woman.frame.size.height);
        man.layer.cornerRadius = 5;
        man.clipsToBounds = YES;
        [man addTarget:self action:@selector(sexChoose:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:man];
        self.man = man;
        
    }
    return self;
}

- (void)buttonClick:(UIButton *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(screenwidth, 0, screenwidth, 0);
    }];
    if (sender.tag==2) {
        [self.delegate sexChooseSure:sender];
    }
}
- (void)sexChoose:(UIButton *)sender
{
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    if ([sender.titleLabel.text isEqualToString:@"女"]) {
        NSNumber * number = [NSNumber numberWithInt:2];
        [userdefaults setObject:number forKey:@"sex"];
        [self.man setBackgroundColor:[CorlorTransform colorWithHexString:@"#BBBBBB"]];
        [self.woman setBackgroundColor:[CorlorTransform colorWithHexString:@"#F93B33"]];
        
    }
    if ([sender.titleLabel.text isEqualToString:@"男"]) {
        [self.man setBackgroundColor:[CorlorTransform colorWithHexString:@"#575AB1"]];
        [self.woman setBackgroundColor:[CorlorTransform colorWithHexString:@"#BBBBBB"]];
        NSNumber * number2 = [NSNumber numberWithInt:1];
        [userdefaults setObject:number2 forKey:@"sex"];
    }
    [userdefaults synchronize];
}
@end
