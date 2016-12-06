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
#import "ViewUtil.h"

@interface minePhotoViewController ()<UITableViewDelegate,UITableViewDataSource,minePhotoHeadViewDelegate,UIAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    int i;
}
@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)minePhotoHeadView * headView;
@property(nonatomic,strong)UIImageView * headImage;
@property(nonatomic,strong)UIView * bottomBackGroundView;
@property(nonatomic,strong)BmobUser * user;

@end

@implementation minePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    i=0;
    
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
    i++;
    [self bottomBackGroundView];
    if (i%2==1) {
        
        [UIView animateWithDuration:0.3 animations:^{
            _bottomBackGroundView.frame = CGRectMake(0, screenheight-85, screenwidth, 85);
        }];
        
    }else{

        [UIView animateWithDuration:0.3 animations:^{
            _bottomBackGroundView.frame = CGRectMake(0, screenheight, screenwidth, 85);
        }];
    }
    
}
- (UIView *)bottomBackGroundView
{
    if (!_bottomBackGroundView) {
        _bottomBackGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, screenheight, screenwidth, 85)];
        _bottomBackGroundView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_bottomBackGroundView];
        
        UIView * lineview = [[UIView alloc]initWithFrame:CGRectMake(0, 44, screenwidth, 1)];
        lineview.backgroundColor = [CorlorTransform colorWithHexString:@"#BBBBBB"];
        [_bottomBackGroundView addSubview:lineview];
        
        UIButton * changePhoto = [UIButton buttonWithType:UIButtonTypeCustom];
        [changePhoto setTitle:@"更改展示面图片" forState:UIControlStateNormal];
        [changePhoto setTitleColor:[CorlorTransform colorWithHexString:@"#3C3C3C"] forState:UIControlStateNormal];
        changePhoto.titleLabel.font = [FontOutSystem fontWithFangZhengZhenSize:17.0];
        changePhoto.frame = CGRectMake(0, 0, screenwidth, 44);
        [changePhoto addTarget:self action:@selector(changePhotoAction:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBackGroundView addSubview:changePhoto];
        
        UIButton * cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancel setTitleColor:changePhoto.titleLabel.textColor forState:UIControlStateNormal];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        cancel.frame = CGRectMake(0, 45, screenwidth, 44);
        cancel.titleLabel.font = [FontOutSystem fontWithFangZhengZhenSize:17.0];
        [_bottomBackGroundView addSubview:cancel];
        [cancel addTarget:self  action:@selector(changePhotoCancelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBackGroundView;
}
- (void)changePhotoAction:(UIButton *)sender
{
    [self bottomBackGroundView];
    [UIView animateWithDuration:0.3 animations:^{
        _bottomBackGroundView.frame = CGRectMake(0, screenheight, screenwidth, 85);
    }];
    i--;
    
    UIAlertView * alertview = [[UIAlertView alloc]initWithTitle:@"更改图片" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拍照",@"照片库", nil];
    [alertview show];
}

- (void)changePhotoCancelAction:(UIButton *)sender
{
    [self bottomBackGroundView];
    [UIView animateWithDuration:0.3 animations:^{
        _bottomBackGroundView.frame = CGRectMake(0, screenheight, screenwidth, 85);
    }];
    i--;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        NSLog(@"拍照");
    }else if (buttonIndex == 2){
        NSLog(@"媒体库");
    }
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    ipc.delegate = self;
    [[ipc navigationBar] setTintColor:[CorlorTransform colorWithHexString:@"#3f90a4"]];
    if (buttonIndex == 1) {
        //NSLog(@"1");
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
            ipc.showsCameraControls  = YES;
            [self presentViewController:ipc animated:YES completion:nil];
            
        }else{
            //NSLog(@"硬件不支持");
        }
    }
    if (buttonIndex == 2) {
        [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:ipc animated:YES completion:nil];
    }

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.headImage.image = image;
    
    UIImage *scaleImage = [ViewUtil imageByScalingToSize:CGSizeMake(200, 200) sourceImage:image];
    BmobFile *file = [[BmobFile alloc] initWithFileName:@"backGroundPhoto.png" withFileData:UIImagePNGRepresentation(scaleImage)];
    [file saveInBackgroundByDataSharding:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            
            [self modifyUserWithKey:@"backgroundPhotos" object:file.url];
            
        }else{
            
            NSLog(@"%@",error.localizedDescription);
        }
    } progressBlock:^(CGFloat progress) {
        
    }];

    
}

-(void)modifyUserWithKey:(NSString *)key object:(id )object{
    BmobUser * users = [BmobUser objectWithoutDataWithClassName:nil objectId:self.user.objectId];
    [users setObject:object forKey:key];
    [users updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            [self.user setObject:object forKey:key];
            [self.tableview reloadData];
        }else{
            NSLog(@"%@",error);
        }
    }];
    
}

@end
