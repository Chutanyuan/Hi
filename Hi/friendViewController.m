//
//  friendViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "friendViewController.h"
#import "BMChineseSort.h"
#import "Person.h"
#import "headView.h"
#import "followManViewController.h"
#import "followWomanViewController.h"
#import "myFollowViewController.h"
#import "fansViewController.h"
#import "playerMessageViewController.h"
#import "friendVCTableViewCell.h"

@interface friendViewController ()<UITableViewDelegate,UITableViewDataSource,headTableViewAction>
{
    NSMutableArray<Person *> *dataArray;
    UITableView *tableview;
}
@property (nonatomic,strong) NSArray *getFriendArray;//数据源
//排序后的出现过的拼音首字母数组
@property(nonatomic,strong)NSMutableArray *indexArray;
//排序好的结果数组
@property(nonatomic,strong)NSMutableArray *letterResultArr;
@end

@implementation friendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[CorlorTransform colorWithHexString:@"#393A3F"]];
    self.navigationController.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    [self loadData];
}
-(void)loadData{
    self.getFriendArray = [[NSMutableArray alloc]initWithCapacity:0];
    dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSDictionary * parameter = [[NSDictionary alloc]initWithObjectsAndKeys:@"identity",@"-1",@"depart",@"-1",@"sex",@"0",@"username",@"15565864350",@"offset",@"0",@"limit",@"10", nil];
    [BmobCloud callFunctionInBackground:@"getAroundWomen" withParameters:parameter block:^(NSString * data, NSError *error) {
        if (error) {
            NSLog(@"error %@",[error description]);
        }
        self.getFriendArray = [String_Array dictionaryWithJsonString:data];
        
        for (int i = 0; i<[self.getFriendArray count]; i++) {
            Person *p = [[Person alloc] init];
            NSDictionary * dic = self.getFriendArray[i];
            p.name = [NSString stringWithFormat:@"%@",dic[@"user"][@"nickName"]];
            p.number = i;
            p.headUrl = [NSString stringWithFormat:@"%@",dic[@"user"][@"headPhoto"]];
            p.userDic = dic[@"user"];
            [dataArray addObject:p];
        }
        
        if (dataArray.count==_getFriendArray.count) {
            //根据Person对象的 name 属性 按中文 对 Person数组 排序
            self.indexArray = [BMChineseSort IndexWithArray:dataArray Key:@"name"];
            self.letterResultArr = [BMChineseSort sortObjectArray:dataArray Key:@"name"];
            
            tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screenwidth, screenheight-128)];
            tableview.delegate = self;
            tableview.dataSource = self;
            [self.view addSubview:tableview];

        }
    }];
}

#pragma mark - UITableViewDataSource
//section的titleHeader
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.indexArray objectAtIndex:section];
}
//section行数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.indexArray count];
}
//每组section个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * countarray = [self.letterResultArr objectAtIndex:section];
    return countarray.count;
}
//section右侧index数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.indexArray;
}
//点击右侧索引表项时调用 索引与section的对应关系
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
}
//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    friendVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil){
        cell = [[friendVCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    //获得对应的Person对象
    Person *p = [[self.letterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.userDic = p.userDic;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 220;
    }else{
        return 20;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    playerMessageViewController * player = [[playerMessageViewController alloc]init];
//    if (tableView==_searchDisplayController.searchResultsTableView){
//        player.title = [_searchResultArr[indexPath.row] valueForKey:@"name"];
//    }else{
//        ContactModel *model=_rowArr[indexPath.section][indexPath.row];
//        player.title = model.name;
//    }
    
    Person *p = [[self.letterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    player.title = p.userDic[@"nickName"];
    player.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:player animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //viewforHeader
    if (section==0) {
        
        headView * view = [[headView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, 200)];
        view.delegate = self;
        view.backgroundColor = [UIColor whiteColor];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(15, 200, screenwidth, 20)];
        label.text = [NSString stringWithFormat:@"%@",self.indexArray[section]];
        label.backgroundColor = [CorlorTransform colorWithHexString:@"#F7F7F7"];
        UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, 15, 20)];
        label1.backgroundColor = label.backgroundColor;
        [view addSubview:label1];
        [view addSubview:label];
        return view;
    }else{
        return nil;
    }
}
-(void)didSelectRowAtIndexPath:(NSInteger)row
{
    switch (row) {
        case 0:
        {
            followManViewController * man = [[followManViewController alloc]init];
            man.hidesBottomBarWhenPushed = YES;
            man.title = @"关注男生";
            [self.navigationController pushViewController:man animated:YES];
        }
            break;
        case 1:
        {
            followWomanViewController * women = [[followWomanViewController alloc]init];
            women.hidesBottomBarWhenPushed = YES;
            women.title = @"关注女生";
            [self.navigationController pushViewController:women animated:YES];
        }
            break;
        case 2:
        {
            myFollowViewController * my = [[myFollowViewController alloc]init];
            my.hidesBottomBarWhenPushed = YES;
            my.title = @"我关注的";
            [self.navigationController pushViewController:my animated:YES];
        }
            break;
        case 3:
        {
            fansViewController * fans = [[fansViewController alloc]init];
            fans.hidesBottomBarWhenPushed = YES;
            fans.title = @"粉丝";
            [self.navigationController pushViewController:fans animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
