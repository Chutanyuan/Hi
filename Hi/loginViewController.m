//
//  loginViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/22.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "loginViewController.h"
#import <BmobSDK/Bmob.h>


@interface loginViewController ()

{
    
    UIView * topline;
    UIView * centerline;
    UIView * bottonView;
}
@property(nonatomic,strong)UIImageView * logoImage;
@property(nonatomic,strong)UIImageView * oneImage;
@property(nonatomic,strong)UIImageView * twoImage;
@property(nonatomic,strong)UITextField * phoneNumber;
@property(nonatomic,strong)UITextField * password;
@property(nonatomic,strong)UIButton * forgetPassword;
@property(nonatomic,strong)UIButton * loginButton;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self logoImage];
    
    topline = [[UIView alloc]initWithFrame:CGRectMake(0, _logoImage.frame.origin.y+_logoImage.frame.size.height+50, screenwidth, 1)];
    topline.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
    [self.view addSubview:topline];
    
    centerline = [[UIView alloc]initWithFrame:CGRectMake(0, topline.frame.origin.y+45, screenwidth, 1)];
    centerline.backgroundColor = topline.backgroundColor;
    [self.view addSubview:centerline];
    
    bottonView = [[UIView alloc]initWithFrame:CGRectMake(0, centerline.frame.origin.y+45, screenwidth, 1)];
    bottonView.backgroundColor = topline.backgroundColor;
    [self.view addSubview:bottonView];
    [self oneImage];
    [self twoImage];
    [self phoneNumber];
    [self password];
    [self forgetPassword];
    [self loginButton];


    UIButton * exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    exitButton.frame = CGRectMake(20, 20, 80, 40);
    [exitButton setTitle:@"返回注册" forState:UIControlStateNormal];
    [exitButton addTarget:self action:@selector(exitButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitButton];
    
    
}
-(void)exitButton
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(UIImageView *)logoImage
{
    if (!_logoImage) {
        _logoImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7"]];
        _logoImage.frame = CGRectMake(screenwidth/2-40, 100, 80, 80);
        _logoImage.layer.cornerRadius = 10;
        _logoImage.clipsToBounds = YES;
        [self.view addSubview:_logoImage];
    }
    return _logoImage;
}

-(UIImageView *)oneImage
{
    if (!_oneImage) {
        _oneImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, topline.frame.origin.y+11, 22, 22)];
        _oneImage.image = [UIImage imageNamed:@"personal2"];
        [self.view addSubview:_oneImage];
    }
    return _oneImage;
}
-(UIImageView *)twoImage
{
    if (!_twoImage) {
        _twoImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, centerline.frame.origin.y+11, 22, 22)];
        _twoImage.image = [UIImage imageNamed:@"peiwan_locked"];
        [self.view addSubview:_twoImage];
    }
    return _twoImage;
}
-(UITextField *)phoneNumber
{
    if (!_phoneNumber) {
        _phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(_oneImage.frame.origin.x+_oneImage.frame.size.width+10, topline.frame.origin.y+1, screenwidth-(_oneImage.frame.origin.x+_oneImage.frame.size.width+10), 44)];
        _phoneNumber.placeholder = @"手机号";
        [self.view addSubview:_phoneNumber];
    }
    return _phoneNumber;
}
-(UITextField *)password
{
    if (!_password) {
        _password = [[UITextField alloc]initWithFrame:CGRectMake(_phoneNumber.frame.origin.x, _phoneNumber.frame.origin.y+_phoneNumber.frame.size.height+1, _phoneNumber.frame.size.width, 44)];
        _password.placeholder = @"密码";
        [self.view addSubview:_password];
    }
    return _password;
}
-(UIButton *)forgetPassword
{
    if (!_forgetPassword) {
        _forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPassword setTitleColor:[CorlorTransform colorWithHexString:@"#4D4CBA"] forState:UIControlStateNormal];
        CGSize size_title = [_forgetPassword.titleLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_forgetPassword.titleLabel.font,NSFontAttributeName, nil]];
        _forgetPassword.frame = CGRectMake(screenwidth-20-size_title.width, centerline.frame.origin.y+1, size_title.width, 44);
        [_forgetPassword addTarget:self action:@selector(forgetButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_forgetPassword];
        
    }
    return _forgetPassword;
}
- (void)forgetButtonClick:(UIButton *)sender
{
    
}
-(UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(30, bottonView.frame.origin.y+20, screenwidth-60, 44);
        [_loginButton setBackgroundColor:[CorlorTransform colorWithHexString:@"#F8F70A"]];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 5;
        [_loginButton.layer setBorderColor:[UIColor blackColor].CGColor];
        [_loginButton.layer setBorderWidth:1];
        _loginButton.clipsToBounds = YES;
        [_loginButton addTarget:self action:@selector(loginButtonCLick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
        
    }
    return _loginButton;
}
- (void)loginButtonCLick
{
    [BmobUser loginWithUsernameInBackground:_phoneNumber.text password:_password.text block:^(BmobUser *user, NSError *error) {
        if (!error) {
            //登录到嗨界面
            NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
            [userdefaults setObject:@{_phoneNumber.text:@"account",_password.text:@"password"} forKey:@"userLoginMessage"];
            [userdefaults synchronize];
            
            [self performSegueWithIdentifier:@"loginplayer" sender:nil];
        }else{
            [ShowMessage showMessage:@"登录失败"];
        }
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
