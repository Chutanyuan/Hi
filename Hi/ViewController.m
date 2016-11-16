//
//  ViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "ViewController.h"
#import "HiTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableview;

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [self setTabbar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条颜色 标题颜色
    [self.navigationController.navigationBar setBarTintColor:[CorlorTransform colorWithHexString:@"#393A3F"]];
    self.navigationController.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    // Do any additional setup after loading the view, typically from a nib.
    [self tableview];
    
}
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight-44) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.backgroundColor = [CorlorTransform colorWithHexString:@"#F0F0F2"];
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
#pragma mark---tableview delegate datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HiTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[HiTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/**设置tabbar*/
- (void)setTabbar
{
    //设置tabbarItem图片
    NSArray *items = self.tabBarController.tabBar.items;
    self.tabBarController.tabBar.translucent = false;
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [self.tabBarController.tabBar setBackgroundImage:img];
    
    [self.tabBarController.tabBar setShadowImage:img];
    
    UITabBarItem *hi = items[0];
    [hi setTitleTextAttributes:[NSDictionary dictionaryWithObject:[CorlorTransform colorWithHexString:@"#00A322"] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    hi.image = [[UIImage imageNamed:@"dongtai2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hi.selectedImage = [[UIImage imageNamed:@"dongtai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *friend = items[1];
    [friend setTitleTextAttributes:[NSDictionary dictionaryWithObject:[CorlorTransform colorWithHexString:@"#00A322"] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    friend.image = [[UIImage imageNamed:@"pai-hang-bang@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    friend.selectedImage = [[UIImage imageNamed:@"pai-hang-bang2@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UITabBarItem * newEvents = items[2];
    [newEvents setTitleTextAttributes:[NSDictionary dictionaryWithObject:[CorlorTransform colorWithHexString:@"#00A322"] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    
    
    newEvents.image = [[UIImage imageNamed:@"information"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newEvents.selectedImage = [[UIImage imageNamed:@"information2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    UITabBarItem *mine = items[3];
    [mine setTitleTextAttributes:[NSDictionary dictionaryWithObject:[CorlorTransform colorWithHexString:@"#00A322"] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    mine.image = [[UIImage imageNamed:@"personal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mine.selectedImage = [[UIImage imageNamed:@"personal2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
