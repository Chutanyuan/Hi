//
//  messageNoticViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/21.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "messageNoticViewController.h"

@interface messageNoticViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableview;

@end

@implementation messageNoticViewController

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
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell.contentView addSubview:line];
    }
    if (indexPath.section==0) {
        cell.textLabel.text = @"接收新消息通知";
    }else if (indexPath.section==1){
        cell.textLabel.text = @"通知显示消息详情";
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            cell.textLabel.text = @"声音";
        }else{
            cell.textLabel.text = @"震动";
        }
    }else{
        cell.textLabel.text = @"新鲜照片更新";
    }
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==2) {
        return 2;
    }else {
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
   
}

@end
