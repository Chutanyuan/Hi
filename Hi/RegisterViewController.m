//
//  RegisterViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/21.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (strong, nonatomic) UIImageView *logo;
@property (strong, nonatomic) UIImageView *leftLogo;
@property (strong, nonatomic) UIView *topLine;
@property (strong, nonatomic) UIView *bottomLine;
@property (strong, nonatomic) UITextField *textfiled;
@property (strong, nonatomic) UIButton *registeButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self logo];
    [self topLine];
    [self leftLogo];
    [self textfiled];
    [self bottomLine];
    [self registeButton];
    
    // Do any additional setup after loading the view.
}

-(UIImageView *)logo
{
    if (!_logo) {
        _logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3"]];
        _logo.frame = CGRectMake(screenwidth/2-40, 100, 80, 80);
        _logo.layer.cornerRadius = 10;
        _logo.clipsToBounds = YES;
        [self.view addSubview:_logo];
    }
    return _logo;
}
-(UIImageView *)leftLogo
{
    if (!_leftLogo) {
        _leftLogo = [[UIImageView alloc]initWithFrame:CGRectMake(30, _topLine.frame.origin.y+1+15, 30, 30)];
        _leftLogo.image = [UIImage imageNamed:@"shareFriends"];
        [self.view addSubview:_leftLogo];
    }
    return _leftLogo;
}
-(UIView *)topLine
{
    if (!_topLine) {
        _topLine = [[UIView alloc]init];
        _topLine.frame = CGRectMake(0, _logo.frame.origin.y+_logo.frame.size.height+80, screenwidth, 1);
        _topLine.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self.view addSubview:_topLine];
    }
    return _topLine;
}
-(UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, _topLine.frame.origin.y+1+60, screenwidth, 1)];
        _bottomLine.backgroundColor = _topLine.backgroundColor;
        [self.view addSubview:_bottomLine];
    }
    return _bottomLine;
}
-(UITextField *)textfiled
{
    if (!_textfiled) {
        _textfiled = [[UITextField alloc]initWithFrame:CGRectMake(_leftLogo.frame.origin.x+_leftLogo.frame.size.width+10, _topLine.frame.origin.y+1, screenwidth-(_leftLogo.frame.origin.x+_leftLogo.frame.size.width+10)-10, 60)];
        _textfiled.placeholder = @"请正确输入您的手机号码";
        _textfiled.keyboardType = UIKeyboardTypeNumberPad;
        [self.view addSubview:_textfiled];
    }
    return _textfiled;
}
-(UIButton *)registeButton
{
    if (!_registeButton) {
        
    }
    return _registeButton;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
