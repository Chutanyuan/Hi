//
//  PersonalSettingViewController.m
//  Hi
//
//  Created by user_kevin on 16/11/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "PersonalSettingViewController.h"
#import "settingHeaderCell.h"
#import "settingRightTitleCell.h"
#import "MBProgressHUD.h"
#import "CompressImage.h"
#import "ViewUtil.h"
#import "JobView.h"
#import "adressView.h"


@interface PersonalSettingViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,JobViewDelegate,adressViewDelegate>
{
    settingHeaderCell * cell;
}
@property(nonatomic,strong)BmobUser* user;
@property(nonatomic,strong)UITableView * tableview;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) JobView *jobView;
@property (strong, nonatomic) adressView *adressview;


@end

@implementation PersonalSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [BmobUser currentUser];
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = [[NSMutableArray alloc] initWithObjects:@(SettingTypeSpace),@(SettingTypeAvatar),@(SettingTypeNick),@(SettingTypeGender),@(SettingTypeSpace),@(SettingTypeFeedback), nil];
    // Do any additional setup after loading the view.
    [self tableview];
    
}
-(UITableView *)tableview{
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
    NSArray * titleone = @[@"头像",@"身份",@"区域",@"兴趣爱好",@"喜欢的电影",@"最爱的美食",@"旅游目的地"];
    NSArray * titletwo = @[@"身高",@"性别",@"名字",@"手机"];

    if (indexPath.row==0) {
        if (indexPath.section==0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"header"];
            if (!cell) {
                cell = [[settingHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"header"];
            }
            cell.textLabel.text = @"头像";
            [cell.imageview sd_setImageWithURL:[NSURL URLWithString:[self.user objectForKey:@"headPhoto"]] placeholderImage:nil];
            return cell;
        }else{
            settingRightTitleCell * defaulteCell = [tableView dequeueReusableCellWithIdentifier:@"defaults"];
            if (!defaulteCell) {
                defaulteCell = [[settingRightTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"defaults"];
            }
            defaulteCell.textLabel.text = @"身高";
            return defaulteCell;
        }
    }else{
        settingRightTitleCell * deCell = [tableView dequeueReusableCellWithIdentifier:@"deCell"];
        if (!deCell) {
            deCell = [[settingRightTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deCell"];
        }
        if (indexPath.section==0) {
            if (indexPath.row==1) {
                NSString * userIdentity = [NSString stringWithFormat:@"%@",[self.user objectForKey:@"userIdentity"]];
                if ([userIdentity isEqualToString:@""]) {
                    
                    deCell.label.text = @"慎重选择半年内不可更改";
                    deCell.label.font = [FontOutSystem fontWithFangZhengSize:12.0];
                    deCell.label.textColor = [UIColor redColor];

                }else{
                    
                    deCell.label.text = userIdentity;
                    deCell.label.font = [FontOutSystem fontWithFangZhengSize:15];
                    deCell.label.textColor = [UIColor redColor];

                }
            }else if (indexPath.row==2){
                NSString * city = [NSString stringWithFormat:@"%@",[self.user objectForKey:@"city"]];
                if ([city isEqualToString:@""]) {
                    
                }else{
                    deCell.label.text = city;
                    deCell.label.font = [FontOutSystem fontWithFangZhengSize:15];
                }

            }else{
                
            }
            deCell.textLabel.text = [NSString stringWithFormat:@"%@",titleone[indexPath.row]];

        }else{
            deCell.textLabel.text = [NSString stringWithFormat:@"%@",titletwo[indexPath.row]];
            if (indexPath.row==1) {
                NSNumber * number =[self.user objectForKey:@"sex"];
                int sexNumber = [number intValue];
                if (sexNumber==1) {
                    deCell.label.text = @"男";
                }else if([[self.user objectForKey:@"sex"] isEqual:@"2"]){
                    deCell.label.text = @"女";
                }
            }else if (indexPath.row==2){
                if ([[self.user objectForKey:@"nickName"] isEqual:@""]) {
                    
                }else{
                    deCell.label.text = [NSString stringWithFormat:@"%@",[self.user objectForKey:@"nickName"]];
                }
            }else if (indexPath.row==3){
                if ([[self.user objectForKey:@"mobilePhoneNumber"] isEqual:@""]) {
                    
                }else{
                    deCell.label.text = [NSString stringWithFormat:@"%@",[self.user objectForKey:@"mobilePhoneNumber"]];
                }
            }
        }
        return deCell;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 7;
    }else{
        return 4;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cellHeight = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cellHeight.frame.size.height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0&&indexPath.row==0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"选择图片" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选取", nil];
        [alert show];
    }
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 1:
            {
                [self jobView];
                [UIView animateWithDuration:0.3 animations:^{
                    
                    self.jobView.frame = CGRectMake(0, 120+64, screenwidth, 305);
                }];
            }
                break;
            case 2:
            {
                [self adressview];
                [UIView animateWithDuration:0.3 animations:^{

                    self.adressview.frame = CGRectMake(0, 120+64, screenwidth, 305);
                }];
            }
                break;
            case 3:
            {
                
            }
                break;
            case 4:
            {
                
            }
                break;
            case 5:
            {
                
            }
                break;
            case 6:
            {
                
            }
                break;
                
            default:
                break;
        }

    }else{
        switch (indexPath.row) {
            case 0:
            {
                
            }
                break;
            case 2:
            {
                [self changeNick];
            }
                break;
            case 3:
            {
                
            }
                break;
                
            default:
                break;
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==10) {
        
        if (buttonIndex == [alertView cancelButtonIndex]) {
            return;
        }
        switch (buttonIndex) {
            case 0:
                break;
            case 1:{
                [self modifyUserWithKey:@"nickName" object:[alertView textFieldAtIndex:0].text];
            }
                break;
            default:
                break;
        }
    }else{
        UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
        ipc.delegate = self;
        [[ipc navigationBar] setTintColor:[CorlorTransform colorWithHexString:@"#3f90a4"]];
        if (buttonIndex == 1) {
            //NSLog(@"1");
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
                ipc.allowsEditing = YES;
                ipc.showsCameraControls  = YES;
                [self presentViewController:ipc animated:YES completion:nil];
                
            }else{
                //NSLog(@"硬件不支持");
            }
        }
        if (buttonIndex == 2) {
            [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            ipc.allowsEditing = YES;
            [self presentViewController:ipc animated:YES completion:nil];
        }
        
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info{

    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    UIImage *image = info[UIImagePickerControllerEditedImage];
    cell.imageview.image = image;
    if (image.size.width != image.size.height) {
        [ShowMessage showMessage:@"长宽不一致"];
    }else{
        UIImage *scaleImage = [ViewUtil imageByScalingToSize:CGSizeMake(200, 200) sourceImage:image];
        BmobFile *file = [[BmobFile alloc] initWithFileName:@"photo.png" withFileData:UIImagePNGRepresentation(scaleImage)];
        [file saveInBackgroundByDataSharding:^(BOOL isSuccessful, NSError *error) {
            if (isSuccessful) {
                
                [self modifyUserWithKey:@"headPhoto" object:file.url];
                
            }else{
                
                NSLog(@"%@",error.localizedDescription);
            }
        } progressBlock:^(CGFloat progress) {
            
        }];
        
    }

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

-(void)changeNick{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"填入昵称"
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    alertView.tag = 10;
    [alertView show];
}
-(UIView *)jobView
{
    if (!_jobView) {
        _jobView = [[JobView alloc]initWithFrame:CGRectMake(screenwidth, 0, screenwidth, 305)];
        BmobQuery * bmobquery = [BmobQuery queryWithClassName:@"IdentityType"];
        [bmobquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            
            _jobView.jobArray = array;
            
        }];
        _jobView.backgroundColor = [UIColor whiteColor];
        _jobView.delegate = self;
        [self.view addSubview:_jobView];
    }
    return _jobView;
}
-(adressView *)adressview
{
    if (!_adressview) {
        _adressview = [[adressView alloc]initWithFrame:CGRectMake(screenwidth, 0, screenwidth, 305)];
        BmobQuery * bmobquery = [BmobQuery queryWithClassName:@"Depart"];
        [bmobquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            
            _adressview.adressArray = array;
            
        }];

        _adressview.backgroundColor = [UIColor whiteColor];
        _adressview.delegate = self;
        [self.view addSubview:_adressview];
    }
    return _adressview;
}
-(void)adressLabelText:(NSString *)text
{
    [self modifyUserWithKey:@"city" object:text];
    [_tableview reloadData];
}
-(void)jobLabelText:(NSString *)text
{
    [self modifyUserWithKey:@"userIdentity" object:text];
    [_tableview reloadData];
}
@end
