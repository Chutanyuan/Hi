//
//  headView.m
//  Hi
//
//  Created by user_kevin on 16/11/16.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "headView.h"

@interface headView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation headView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, 200) style:UITableViewStylePlain];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.scrollEnabled = NO;
        [self addSubview:tableview];
        
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray * array = @[@"关注男生",@"关注女生",@"我关注的",@"粉丝"];
    NSArray * imageArray = @[@"man",@"women",@"addfriend",@"people"];
    cell.textLabel.text = array[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[indexPath.row]]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate didSelectRowAtIndexPath:indexPath.row];
}
@end
