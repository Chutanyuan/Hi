//
//  mineViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "mineViewController.h"
#import "mineHeaderTableViewCell.h"
#import "settingViewController.h"
#import "chooseSexView.h"
#import "PersonalSettingViewController.h"
#import "PrivacyViewController.h"
#import "minePhotoViewController.h"
#import "collectViewController.h"

#import <BmobSDK/Bmob.h>

@interface mineViewController ()<UITableViewDelegate,UITableViewDataSource,chooseSexDelegate>

@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)BmobUser* user;
@property(nonatomic,strong)chooseSexView * chooseSex;

@end

@implementation mineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条颜色 标题颜色
    [self.navigationController.navigationBar setBarTintColor:[CorlorTransform colorWithHexString:@"#393A3F"]];
    self.navigationController.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    //保证push的时候pop页面的返回按钮颜色是白色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    [self user];
    
    [self tableview];
    
}
-(BmobUser *)user
{
    if (!_user) {
        _user = [BmobUser currentUser];
    }
    return _user;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight-44) style:UITableViewStyleGrouped];
        _tableview.delegate =self;
        _tableview.dataSource =self;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
-(UIView *)chooseSex
{
    if (!_chooseSex) {
        _chooseSex = [[chooseSexView alloc]initWithFrame:CGRectMake(screenwidth, 0, screenwidth, 200)];
        _chooseSex.backgroundColor = [UIColor whiteColor];
        _chooseSex.delegate = self;
        [self.view addSubview:_chooseSex];
    }
    return _chooseSex;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        mineHeaderTableViewCell * sectionOne = [tableView dequeueReusableCellWithIdentifier:@"sectionOne"];
        if (!sectionOne) {
            sectionOne = [[mineHeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sectionOne"];
        }
        return sectionOne;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, screenwidth, 1)];
        line.backgroundColor = [CorlorTransform colorWithHexString:@"#C8C7CC"];

        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            [cell.contentView addSubview:line];
        }
        if (indexPath.section==2) {
            if (indexPath.row==0) {
                cell.imageView.image = [UIImage imageNamed:@"common_list_mingpian"];
                cell.textLabel.text = @"相册";
            }else{
                cell.imageView.image = [UIImage imageNamed:@"content_list_icon_hui"];
                cell.textLabel.text = @"收藏";
            }
        }
        if (indexPath.section==3) {
            if (indexPath.row == 0) {
                cell.imageView.image = [UIImage imageNamed:@"bg_setting"];
                cell.textLabel.text = @"设置";
            }
        }
        if (indexPath.section==1) {
            if (indexPath.row==0) {
                cell.imageView.image = [UIImage imageNamed:@"common_list_mingpian"];
                cell.textLabel.text = @"隐私";
            }
        }
        return cell;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==2) {
        return 2;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            NSDictionary * data = [_user requestDataDictionary];
            UserData * userdata = [[UserData alloc]initUserAttribute:data];
            NSString * sex = userdata.sex;
            if ([sex isEqualToString:@"0"]) {
                
                [self chooseSex];
                [UIView animateWithDuration:0.3 animations:^{
                    _chooseSex.frame = CGRectMake(0, screenheight/2-100, screenwidth, 200);
                }];

            }else if(sex>0){
                
                PersonalSettingViewController * personalSetting = [[PersonalSettingViewController alloc]init];
                personalSetting.title = @"个人信息";
                personalSetting.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:personalSetting animated:YES];
            }
        }
            break;
        case 1:
        {
            PrivacyViewController * pricacy = [[PrivacyViewController alloc]init];
            pricacy.hidesBottomBarWhenPushed = YES;
            pricacy.title = @"隐私";
            [self.navigationController pushViewController:pricacy animated:YES];
        }
            break;
        case 2:
        {
            if (indexPath.row==0) {
                minePhotoViewController * photo = [[minePhotoViewController alloc]init];
                photo.hidesBottomBarWhenPushed = YES;
                photo.title = @"相册";
                [self.navigationController pushViewController:photo animated:YES];
            }else{
                collectViewController * collect = [[collectViewController alloc]init];
                collect.hidesBottomBarWhenPushed = YES;
                collect.title = @"收藏";
                [self.navigationController pushViewController:collect animated:YES];
            }
        }
            break;
        case 3:
        {
            settingViewController * setting = [[settingViewController alloc]init];
            setting.hidesBottomBarWhenPushed = YES;
            setting.title = @"设置";
            [self.navigationController pushViewController:setting animated:YES];
            
        }
            break;
            
            
        default:
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

-(void)sexChooseSure:(UIButton *)sender
{
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    NSNumber * sex = [userdefaults objectForKey:@"sex"];
    [userdefaults synchronize];
    [_user setObject:sex forKey:@"sex"];
    [_user updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        
    }];
}
@end
