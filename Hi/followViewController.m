//
//  followViewController.m
//  Hi
//
//  Created by user_kevin on 16/12/1.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "followViewController.h"

@interface followViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIImageView * imageview;
@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)UILabel * userIdentity;
@property(nonatomic,strong)UILabel * address;
@property(nonatomic,strong)UILabel * hobby;
@property(nonatomic,strong)UILabel * movie;
@property(nonatomic,strong)UILabel * food;
@property(nonatomic,strong)UILabel * lovePlace;

@end

@implementation followViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    model_dic * userDic = [[model_dic alloc]initWithDictionary:self.username_bmob];
    self.title = [NSString stringWithFormat:@"%@",userDic.nickName];
    self.view.backgroundColor = [UIColor blackColor];

    [self tableview];
    
    
    // Do any additional setup after loading the view.
}
-(UITableView *)tableview
{
    if (_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight) style:UITableViewStyleGrouped];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return screenheight;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight)];
    
    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, screenwidth-40, screenheight)];
    [_imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[_username_bmob objectForKey:@"headPhoto"]]]];
    [view addSubview:_imageview];
    
    return view;
}

@end
