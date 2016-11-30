//
//  settingViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/18.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "settingViewController.h"
#import "AccountSafeViewController.h"
#import "messageNoticViewController.h"
#import "PrivacyViewController.h"
#import "CurrentViewController.h"
#import "HelpViewController.h"
#import "AboutOurViewController.h"
#import "RegisterViewController.h"
#import <BmobSDK/Bmob.h>

@interface settingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableview;

@end

@implementation settingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self tableview];
    
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource =self;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, screenwidth, 1)];
    line.backgroundColor = [CorlorTransform colorWithHexString:@"#C8C7CC"];

    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell.contentView addSubview:line];
    }
    if (indexPath.section==0) {
        cell.textLabel.text = @"账号与安全";
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            cell.textLabel.text = @"新消息通知";
        }else{
            cell.textLabel.text = @"通用";
        }
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            cell.textLabel.text = @"帮助与反馈";
        }else if (indexPath.row==1){
            cell.textLabel.text = @"关于嗨";
        }
    }else{
        cell.textLabel.text = @"退出登录";
    }
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 2;
    }else if (section==2){
        return 2;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        //帐号与安全
        AccountSafeViewController * account = [[AccountSafeViewController alloc]init];
        account.title = @"帐号与安全";
        [self.navigationController pushViewController:account animated:YES];
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            //新消息通知
            messageNoticViewController * message = [[messageNoticViewController alloc]init];
            message.title = @"新消息通知";
            [self.navigationController pushViewController:message animated:YES];
        }else{
            //通用
            CurrentViewController * current = [[CurrentViewController alloc]init];
            current.title = @"通用";
            [self.navigationController pushViewController:current animated:YES];
        }
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            //帮助与反馈
            HelpViewController * help = [[HelpViewController alloc]init];
            help.title = @"帮助与反馈";
            [self.navigationController pushViewController:help animated:YES];
        }
        else{
            //关于嗨
            AboutOurViewController * about = [[AboutOurViewController alloc]init];
            about.title = @"关于嗨";
            [self.navigationController pushViewController:about animated:YES];
        }
    }else{
        //退出登录
        [BmobUser logout];

        EMError * error = [[EMClient sharedClient] logout:YES];
        if (!error) {
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            RegisterViewController *lv = [story instantiateViewControllerWithIdentifier:@"register"];
            [self presentViewController:lv animated:YES completion:nil];

        }
        
        
    }
}

@end
