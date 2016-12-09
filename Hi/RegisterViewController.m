//
//  RegisterViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/21.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "RegisterViewController.h"
#import <BmobSDK/Bmob.h>

#import "loginViewController.h"
#import "ViewController.h"

@interface RegisterViewController ()
{
    UIView * bottom;
    UILabel * label;
    UIButton * cancel;
    UIButton * sure;
    NSString * PhoneNumber;
    NSString * smsCode;
}
@property (strong, nonatomic) UIImageView *logo;
@property (strong, nonatomic) UIImageView *leftLogo;
@property (strong, nonatomic) UIView *topLine;
@property (strong, nonatomic) UIView *bottomLine;
@property (strong, nonatomic) UITextField *textfiled;
@property (strong, nonatomic) UIButton *registeButton;
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIView *sendView;
@property (strong, nonatomic) UILabel *htmlLabel;

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
    [self loginButton];
    [self sendView];
    [self htmlLabel];
    
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
        _leftLogo = [[UIImageView alloc]initWithFrame:CGRectMake(30, _topLine.frame.origin.y+1+11, 22, 22)];
        _leftLogo.image = [UIImage imageNamed:@"shareFriends"];
        [self.view addSubview:_leftLogo];
    }
    return _leftLogo;
}
-(UIView *)topLine
{
    if (!_topLine) {
        _topLine = [[UIView alloc]init];
        _topLine.frame = CGRectMake(0, _logo.frame.origin.y+_logo.frame.size.height+50, screenwidth, 1);
        _topLine.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [self.view addSubview:_topLine];
    }
    return _topLine;
}
-(UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, _topLine.frame.origin.y+1+44, screenwidth, 1)];
        _bottomLine.backgroundColor = _topLine.backgroundColor;
        [self.view addSubview:_bottomLine];
    }
    return _bottomLine;
}
-(UITextField *)textfiled
{
    if (!_textfiled) {
        _textfiled = [[UITextField alloc]initWithFrame:CGRectMake(_leftLogo.frame.origin.x+_leftLogo.frame.size.width+10, _topLine.frame.origin.y+1, screenwidth-(_leftLogo.frame.origin.x+_leftLogo.frame.size.width+10)-10, 44)];
        _textfiled.placeholder = @"请正确输入您的手机号码";
        _textfiled.keyboardType = UIKeyboardTypeNumberPad;
        [self.view addSubview:_textfiled];
    }
    return _textfiled;
}
-(UIButton *)registeButton
{
    if (!_registeButton) {
        _registeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registeButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_registeButton setBackgroundColor:[CorlorTransform colorWithHexString:@"#F8F70A"]];
        [_registeButton.layer setBorderColor:[UIColor blackColor].CGColor];
        [_registeButton.layer setBorderWidth:1];
        _registeButton.layer.cornerRadius = 5;
        _registeButton.clipsToBounds = YES;
        _registeButton.frame = CGRectMake(40, _bottomLine.frame.origin.y+50, screenwidth-80, 44);
        [self.view addSubview:_registeButton];
        _registeButton.tag = 0;
        [_registeButton addTarget:self action:@selector(registeButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registeButton;
}
-(UILabel *)htmlLabel
{
    if (!_htmlLabel) {
        _htmlLabel = [[UILabel alloc]init];
        _htmlLabel.text = @"注册表示你同意《嗨APP用户协议》";
        _htmlLabel.font = [FontOutSystem fontWithFangZhengSize:12.0];
        CGSize size_hemlLabel = [_htmlLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_htmlLabel.font,NSFontAttributeName, nil]];
        _htmlLabel.frame = CGRectMake(0, screenheight-size_hemlLabel.height-20, screenwidth, size_hemlLabel.height);
        _htmlLabel.textColor = [CorlorTransform colorWithHexString:@"#4B4ABA"];
        _htmlLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_htmlLabel];
    }
    return _htmlLabel;
}
-(UIView *)sendView
{
    if (!_sendView) {
        _sendView = [[UIView alloc]initWithFrame:CGRectMake(screenwidth, _topLine.frame.origin.y, screenwidth, 50)];
        _sendView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:_sendView];
        

        UIView * top = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, 1)];
        top.backgroundColor = _topLine.backgroundColor;
        [_sendView addSubview:top];
        
        bottom = [[UIView alloc]init];
        bottom.backgroundColor = _topLine.backgroundColor;
        [_sendView addSubview:bottom];
        
        label = [[UILabel alloc]init];
        
        [_sendView addSubview:label];
        
        cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel setTitleColor:[CorlorTransform colorWithHexString:@"#4B00E6"] forState:UIControlStateNormal];
        cancel.layer.cornerRadius = 5;
        [cancel.layer setBorderColor:[CorlorTransform colorWithHexString:@"#BBBBBB"].CGColor];
        [cancel.layer setBorderWidth:1];
        cancel.clipsToBounds = YES;
        [cancel addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        [_sendView addSubview:cancel];
        
        sure = [UIButton buttonWithType:UIButtonTypeCustom];
        [sure setTitle:@"确认" forState:UIControlStateNormal];
        [sure setTitleColor:cancel.titleLabel.textColor forState:UIControlStateNormal];
        sure.layer.cornerRadius = 5;
        sure.layer.borderColor = [CorlorTransform colorWithHexString:@"#BBBBBB"].CGColor;
        sure.layer.borderWidth = 1;
        sure.clipsToBounds = YES;
        [sure addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        [_sendView addSubview:sure];
        
        
    }
    return _sendView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)registeButtonClick
{

    
    if (_registeButton.tag==0) {
        if ([self judgePhoneNumber:_textfiled.text]==YES) {
            
            [_registeButton setTitle:@"开启奇妙旅程" forState:UIControlStateNormal];
            [UIView animateWithDuration:0.3 animations:^{
                
                _sendView.frame = CGRectMake(0, _topLine.frame.origin.y-2, screenwidth, 200);
                bottom.frame = CGRectMake(0, _sendView.frame.size.height-1, screenwidth, 1);
                
                label.text = [NSString stringWithFormat:@"确认手机号码\n \n 我们将发送验证码短信到：\n%@",_textfiled.text];
                PhoneNumber = self.textfiled.text;
                label.numberOfLines = 0;
                label.textAlignment = NSTextAlignmentCenter;
                CGSize size = CGSizeMake(screenwidth-120, 3000);
                CGSize size_label = [label.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName, nil] context:nil].size;
                label.frame = CGRectMake(screenwidth/2-size_label.width/2, 40, size_label.width, size_label.height);
                
                cancel.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y+label.frame.size.height+10, (size_label.width-10)/2, 200-(label.frame.origin.y+label.frame.size.height+10)-10);
                sure.frame = CGRectMake(cancel.frame.origin.x+cancel.frame.size.width+10, cancel.frame.origin.y, cancel.frame.size.width, cancel.frame.size.height);
                
                
            }];
            
        }else{
            [ShowMessage showMessage:@"手机号码不正确"];
        }
    }else if (_registeButton.tag == 10){
        smsCode = self.textfiled.text;
        _textfiled.placeholder = @"请设置一个您熟记的密码";
        _textfiled.text = @"";
        [_registeButton setTitle:@"注册" forState:UIControlStateNormal];
        _registeButton.tag = 100;

    }else if (_registeButton.tag == 100){
        
        EMError *error = [[EMClient sharedClient] registerWithUsername:PhoneNumber password:@"123456"];
        NSLog(@"%@",error);
        if (error==nil) {
            [ShowMessage showMessage:@"注册成功请登录"];
            [_registeButton setTitle:@"注册成功请登录" forState:UIControlStateNormal];

            [BmobUser signOrLoginInbackgroundWithMobilePhoneNumber:PhoneNumber SMSCode:smsCode andPassword:_textfiled.text block:^(BmobUser *user, NSError *error) {
                if (!error) {
                    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
                    [userdefaults setObject:@{PhoneNumber:@"account",_textfiled.text:@"password"} forKey:@"userLoginMessage"];
                    [userdefaults synchronize];
                    [self performSegueWithIdentifier:@"player" sender:nil];
                    
                }else{
                    NSLog(@"%@",error);
                }
                
            }];

            
        }else{
            NSLog(@"%u",error.code);
            if (error.code==203) {
                [ShowMessage showMessage:@"用户已存在"];
            }
        }

        
        
    }
}

- (void)sureClick
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _sendView.frame = CGRectMake(screenwidth, _topLine.frame.origin.y, screenwidth, 50);
        bottom.frame = CGRectMake(0, _sendView.frame.size.height-1, screenwidth, 1);
        
        
    }];

    [_registeButton setTitle:@"Hi" forState:UIControlStateNormal];
    _registeButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];//又粗又斜
    _registeButton.tag = 10;
    _textfiled.placeholder = @"请输入你收到的短信验证码";
    _textfiled.text = @"";
    
    
    //请求验证码
    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:PhoneNumber andTemplate:@"test" resultBlock:^(int msgId, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            //获得smsID
            NSLog(@"sms ID：%d",msgId);
        }
    }];
    
}
- (void)cancelClick
{
    
    [UIView animateWithDuration:0.3 animations:^{
        _sendView.frame = CGRectMake(screenwidth, _topLine.frame.origin.y, screenwidth, 50);
        bottom.frame = CGRectMake(0, _sendView.frame.size.height-1, screenwidth, 1);
        [_registeButton setTitle:@"注册" forState:UIControlStateNormal];
    }];
    
}

// 判断是否是11位手机号码
- (BOOL)judgePhoneNumber:(NSString *)phoneNum
{
    /**
     * 移动号段正则表达式
     */
    NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    /**
     * 联通号段正则表达式
     */
    NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    /**
     * 电信号段正则表达式
     */
    NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    
    // 一个判断是否是手机号码的正则表达式
    NSString *pattern = [NSString stringWithFormat:@"(%@)|(%@)|(%@)",CM_NUM,CU_NUM,CT_NUM];
    
    NSRegularExpression *regularExpression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSString *mobile = [phoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11) {
        NO;
    }
    
    // 无符号整型数据接收匹配的数据的数目
    NSUInteger numbersOfMatch = [regularExpression numberOfMatchesInString:mobile options:NSMatchingReportProgress range:NSMakeRange(0, mobile.length)];
    if (numbersOfMatch>0) return YES;
    
    return NO;
    
}


-(UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(_registeButton.frame.origin.x, _registeButton.frame.origin.y+_registeButton.frame.size.height+10, _registeButton.frame.size.width, _registeButton.frame.size.height);
        _loginButton.layer.cornerRadius = 5;
        _loginButton.layer.borderColor = [UIColor blackColor].CGColor;
        _loginButton.layer.borderWidth = 1;
        _loginButton.backgroundColor = _registeButton.backgroundColor;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.clipsToBounds = YES;
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
    }
    return _loginButton;
}
- (void)loginClick{

    [self performSegueWithIdentifier:@"modellogin" sender:nil];
}
@end
