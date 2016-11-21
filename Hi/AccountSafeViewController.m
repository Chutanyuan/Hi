//
//  AccountSafeViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/21.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "AccountSafeViewController.h"

@interface AccountSafeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableview;

@end

@implementation AccountSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableview];

    // Do any additional setup after loading the view.
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
    
    UILabel * phoneNumber = [[UILabel alloc]init];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell.contentView addSubview:line];
        if (indexPath.section==0) {
            [cell.contentView addSubview:phoneNumber];
        }
    }
    if (indexPath.section==0) {
        cell.textLabel.text = @"手机号";
        phoneNumber.text = @"18898765432";
        phoneNumber.font = [FontOutSystem fontWithFangZhengSize:15.0];
        CGSize size_phone = [phoneNumber.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:phoneNumber.font,NSFontAttributeName, nil]];
        phoneNumber.frame = CGRectMake(screenwidth-10-size_phone.width, 22-size_phone.height/2, size_phone.width, size_phone.height);
        phoneNumber.textAlignment = NSTextAlignmentRight;
        
    }else if (indexPath.section==1){
        cell.textLabel.text = @"密码";
    }else if (indexPath.section==2){
       cell.textLabel.text = @"安全中心";
    }
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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

    }else if (indexPath.section==1){
        
    }else{
        //退出登录
    }
}

@end
