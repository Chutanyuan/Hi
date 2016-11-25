//
//  minePhotoViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/25.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "minePhotoViewController.h"
#import "minePhotoHeadView.h"
#import "mineContentTableViewCell.h"

@interface minePhotoViewController ()<UITableViewDelegate,UITableViewDataSource,minePhotoHeadViewDelegate>

@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)minePhotoHeadView * headView;
@property(nonatomic,strong)UIImageView * headImage;

@end

@implementation minePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self tableview];
}

#pragma mark----delegate tableview

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    mineContentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[mineContentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _headView = [[minePhotoHeadView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight-64)];
    _headView.delegate = self;
    return _headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return screenheight-64;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark-----懒加载
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
-(void)headViewTapGesture:(UITapGestureRecognizer *)gesture
{
    self.headImage = (UIImageView *)[gesture view];
    self.headImage.image = [UIImage imageNamed:@"12"];
    static int i = 0;
    i++;
    if (i==1) {
        [UIView animateWithDuration:0.3 animations:^{
            [self bottomBackGroundView];
        }];
    }else{
        
    }
    
}
- (UIView *)bottomBackGroundView
{
    UIView * view;
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, screenheight-85, screenwidth, 85)];
        view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view];
        
        UIView * lineview = [[UIView alloc]initWithFrame:CGRectMake(0, 44, screenwidth, 1)];
        lineview.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [view addSubview:lineview];
        
        UIButton * changePhoto = [UIButton buttonWithType:UIButtonTypeCustom];
        [changePhoto setTitle:@"更改展示面图片" forState:UIControlStateNormal];
        [changePhoto setTitleColor:[CorlorTransform colorWithHexString:@"#3C3C3C"] forState:UIControlStateNormal];
        changePhoto.titleLabel.font = [FontOutSystem fontWithFangZhengZhenSize:17.0];
        changePhoto.frame = CGRectMake(0, 0, screenwidth, 44);
        
        [view addSubview:changePhoto];
        
        UIButton * cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancel setTitleColor:changePhoto.titleLabel.textColor forState:UIControlStateNormal];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        cancel.frame = CGRectMake(0, 45, screenwidth, 44);
        cancel.titleLabel.font = [FontOutSystem fontWithFangZhengZhenSize:17.0];
        [view addSubview:cancel];
    }
    return view;
}

@end
