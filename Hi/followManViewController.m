//
//  followManViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "followManViewController.h"
#import "UICollectionViewWaterfallLayout.h"
#import "ZDCollectionViewCell.h"
#import "followViewController.h"

@interface followManViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateWaterfallLayout>
{
    UICollectionViewWaterfallLayout * _layout;
    UICollectionView * _collectionView;
    ZDCollectionViewCell * collectionviewCell;
}
@property (nonatomic,strong)UITableView * tableview;
@property (nonatomic,strong)NSArray * dataArray;

@end

@implementation followManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [[NSArray alloc]init];
    [self getdata];
}
/** Bmob 获取 _user 列表中的所有数据 */
-(void)getdata{
    
    NSDictionary * sendDic = @{@"identity":@"-1",@"depart":@"-1",@"sex":@"1",@"username":@"15565864350",@"offset":@"0",@"limit":@"10"};
    [BmobCloud callFunctionInBackground:@"getAroundWomen" withParameters:sendDic block:^(NSString * dataArray, NSError *error) {
        if (error) {
            NSLog(@"error %@",[error description]);
        }
        self.dataArray = [String_Array dictionaryWithJsonString:dataArray];
        [self tableview];
        
    }] ;
}
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor whiteColor];
        _layout = [[UICollectionViewWaterfallLayout alloc]init];
        _layout.columnCount = 2;//设置两列
        _layout.itemWidth = (screenwidth-30)/2;//设置每个item的宽
        _layout.delegate = self;//通过代理设置item的高
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);//设置区和四周边界的距离
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:_layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [CorlorTransform colorWithHexString:@"#D9D8D9"];
        _collectionView.scrollEnabled = NO;//禁止collection的滑动
        [_collectionView registerClass:[ZDCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [cell.contentView addSubview:_collectionView];
        [_collectionView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _collectionView.contentSize.height + 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, 44)];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
#pragma mark----collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (_dataArray.count>0) {
        return _dataArray.count;
    }else{
        return 0;
    }
}

- (UICollectionViewCell* )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    collectionviewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    collectionviewCell.username_bmob = _dataArray[indexPath.item];
    
    return collectionviewCell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"第%ld个",(long)indexPath.item);
    followViewController * followVC = [[followViewController alloc]init];
    followVC.username_bmob = _dataArray[indexPath.item];
    [self.navigationController pushViewController:followVC animated:YES];
}
#pragma mark - UICollectionViewDelegateWaterfallLayout

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return _layout.itemWidth/5*6;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    CGSize size = [change[@"new"] CGSizeValue];
    //修改 CollectionView 的高度为显示区域的高度。
    CGRect frame = _collectionView.frame;
    frame.size.height = size.height;
    _collectionView.frame = frame;
    
    [_tableview reloadData];
}
- (void)dealloc
{
    [_collectionView removeObserver:self forKeyPath:@"contentSize"];
}


@end
