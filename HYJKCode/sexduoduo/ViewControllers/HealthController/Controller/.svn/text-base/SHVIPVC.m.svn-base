//
//  SHVIPVC.m
//  SexHealth
//
//  Created by ly1992 on 15/6/18.
//  Copyright (c) 2015年 showm. All rights reserved.
//

#import "SHVIPVC.h"
#import "SHHealthButton.h"
#import "SHNearbyDoctorVC.h"
#import "SHBuyServeVC.h"
#import "CTAssetsPickerController.h"
#import "SHConsultingViewController.h"
@interface SHVIPVC ()<CTAssetsPickerControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
//输入框
@property (nonatomic,strong)UITextField *textField;

@property (nonatomic,strong)UITextView *textView;

//添加患者
@property (nonatomic,strong)UIButton *patientBtn;
//患者
@property (nonatomic,strong)UILabel *patientLabel;
//男
@property (nonatomic,strong)UIButton *manBtn;
//女
@property (nonatomic,strong)UIButton *womanBtn;
//照片按钮
@property(nonatomic,strong)UIButton *photoBtn;
//选择医师
@property (nonatomic,strong)SHHealthButton *selectBtn;
//是否匿名
@property (nonatomic,strong)SHHealthButton *mityBtn;
//已有%@用户完成咨询
@property (nonatomic,strong) UIButton *finishButton;
@property (nonatomic,strong)UILabel *label;

@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,strong)UIView *ImageContentView;//承载选择图片的内容
@property(nonatomic,strong)NSMutableArray *imageArr;
@end

@implementation SHVIPVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTopNavView];

    
    [self initView];
    
    [self initData];
    
    
}
#pragma  mark ---UI
//顶部NavView
-(void)setTopNavView
{
    int layOutH = -20;
    if (IOS7_OR_LATER) {
        layOutH = 0;
    }
    
    TopNavView *navView=[[TopNavView alloc] initWithFrame:CGRectMake(0, layOutH,self.view.frame.size.width, 64)];
    [self.view addSubview:navView];
    
    UILabel *titleImgV = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 38*2/3.)];
    titleImgV.backgroundColor = [UIColor clearColor];
    titleImgV.textColor = colorWith01;
    titleImgV.textAlignment = NSTextAlignmentCenter;
    titleImgV.font = [UIFont systemFontOfSize:20.0f];
    if (_type == SHExternalTypeFree) {
        titleImgV.text = @"免费咨询";
    } else if (_type == SHExternalTypeVip || _type == SHExternalTypeDoctor) {
        titleImgV.text = @"VIP服务";
    }
    [navView addSubview:titleImgV];
    //
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 20, 64, 44);
    [leftBtn setImage:[UIImage imageNamed:@"health_navBack"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(bt_action_left) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftBtn];
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame=CGRectMake(navView.frame.size.width-64, 30, 54, 24);
    rightBtn.backgroundColor=colorWith01;
    rightBtn.layer.cornerRadius=10.0;
    rightBtn.tag=1006;
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:rightBtn];
    
}

- (void)initView
{
//    self.scrollView.frame = CGRectMake(0, STAR_Y, k_screenWidth, k_screenHeight-STAR_Y);
    self.scrollView.backgroundColor = RGBCOLOR16(0xebebeb);
    self.scrollView.top = 64;
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, APP_SPACE(260))];
    bgView.backgroundColor = colorWithLYWhite;
    [self.scrollView addSubview:bgView];
    //添加患者图标
    _patientBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _patientBtn.frame=CGRectMake(APP_SPACE(8), APP_SPACE(13), APP_SPACE(20), APP_SPACE(20));
    _patientBtn.backgroundColor=[UIColor whiteColor];
    [_patientBtn setImage:[UIImage imageNamed:@"patient"] forState:UIControlStateNormal];
    [bgView addSubview:_patientBtn];
    //患者
    _patientLabel=[[UILabel alloc]initWithFrame:CGRectMake(_patientBtn.right + APP_SPACE(2), APP_SPACE(13), APP_SPACE(40), APP_SPACE(25))];
    _patientLabel.backgroundColor=colorWithClear;
    _patientLabel.textColor=colorWith04;
    _patientLabel.text=@"患者:";
    _patientLabel.layer.cornerRadius = 4.0f;
    [bgView addSubview:_patientLabel];
    //按钮---男
    UIImage *image = [UIImage imageNamed:@"health_manno"];
    _manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _manBtn.frame = CGRectMake(APP_SPACE(60), APP_SPACE(10), APP_SPACE(75), APP_SPACE(30));
    _manBtn.backgroundColor = colorWithClear;
    [_manBtn setImage:image forState:UIControlStateNormal];
    image = [UIImage imageNamed:@"health_manyes"];
    [_manBtn setImage:image forState:UIControlStateSelected];
    _manBtn.tag = 1000;
    [_manBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:_manBtn];
    //按钮---女
    image = [UIImage imageNamed:@"health_womanno"];
    _womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _womanBtn.frame = CGRectMake(_manBtn.right + APP_SPACE(10), APP_SPACE(10), APP_SPACE(75), APP_SPACE(30));
    _womanBtn.backgroundColor = colorWithClear;
    [_womanBtn setImage:image forState:UIControlStateNormal];
    image = [UIImage imageNamed:@"health_womanyes"];
    [_womanBtn setImage:image forState:UIControlStateSelected];
    _womanBtn.tag = 1001;
    [_womanBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:_womanBtn];
    
    //输入框--年龄
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - APP_SPACE(65), APP_SPACE(10), APP_SPACE(50), APP_SPACE(30))];
    _textField.backgroundColor = colorWithClear;
    _textField.layer.cornerRadius = 4.0f;
    _textField.layer.masksToBounds = YES;
    _textField.layer.borderWidth = 1.0f;
    _textField.layer.borderColor = colorWith04.CGColor;
    _textField.placeholder = NSLocalizedString(@"年龄", nil);
    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.textColor = colorWith03;
    [bgView addSubview:_textField];
    
    //分割线
    UIImageView *lineImageView = [UIImageView imageViewLineWithX:0 withY:APP_SPACE(50) withWidth:SCREEN_WIDTH withHeight:1];
    [bgView addSubview:lineImageView];
    //输入框--内容
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(APP_SPACE(10), lineImageView.bottom, SCREEN_WIDTH - APP_SPACE(40), APP_SPACE(150))];
    _textView.backgroundColor = colorWithClear;
    _textView.textColor = colorWith02;
    _textView.font = Font_ExtraLarge;
    _textView.delegate=self;
    [bgView addSubview:_textView];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(5,0,_textView.frame.size.width,60)];
    _label.enabled=NO;
    _label.text = @"请详细描述你的问题，性多多专家医师会问答你的问题，并确保你的隐私";
    _label.numberOfLines =3;
    _label.lineBreakMode =NSLineBreakByCharWrapping;
    _label.font =  [UIFont systemFontOfSize:15];
    _label.textColor = [UIColor redColor];
    [_textView addSubview:_label];
    //照片按钮
    _photoBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _photoBtn.frame=CGRectMake(_textView.right-APP_SPACE(20), _textView.right-APP_SPACE(80),APP_SPACE(35), APP_SPACE(35));
    [_photoBtn setImage:[UIImage imageNamed:@"photo12"] forState:UIControlStateNormal];
    [_photoBtn addTarget:self action:@selector(photoBtn_click) forControlEvents:UIControlEventTouchUpInside];
    _photoBtn.backgroundColor=[UIColor whiteColor];
    [bgView addSubview:_photoBtn];
    
    //按钮---选择医师
    _selectBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
    _selectBtn.backgroundColor = [UIColor whiteColor];
    _selectBtn.frame = CGRectMake(APP_SPACE(10), bgView.bottom + APP_SPACE(15), APP_SPACE(100), APP_SPACE(25));
    _selectBtn.layer.cornerRadius = 4.0f;
    _selectBtn.layer.masksToBounds = YES;
    _selectBtn.layer.borderColor = RGBCOLOR16(0xbfbfbf).CGColor;
    _selectBtn.layer.borderWidth = 1.0f;
    _selectBtn.tag = 1003;
    [_selectBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_selectBtn];
    image = [UIImage imageNamed:@"health_selectdoctor"];
    _selectBtn.iconImageView.image = image;
    _selectBtn.iconImageView.frame = CGRectMake(APP_SPACE(15), (_selectBtn.height - image.size.height)/2, image.size.width, image.size.height);
    [_selectBtn addSubview:_selectBtn.iconImageView];
    _selectBtn.nameLabel.text = NSLocalizedString(@"选择医师", nil);
    _selectBtn.nameLabel.font = Font_Small;
    _selectBtn.nameLabel.textColor = colorWith01;
    CGSize size = [LYGlobalDefine getTextContent:_selectBtn.nameLabel.text withFont:_selectBtn.nameLabel.font];
    _selectBtn.nameLabel.frame = CGRectMake(_selectBtn.iconImageView.right + APP_SPACE(5), (_selectBtn.height - size.height)/2, size.width, size.height);
    
    [_selectBtn addSubview:_selectBtn.nameLabel];
    if (_type == SHExternalTypeFree) {
        _selectBtn.hidden = YES;
    } else if (_type == SHExternalTypeVip || _type == SHExternalTypeDoctor) {
        _selectBtn.hidden = NO;
    }
    //按钮---匿名
    _mityBtn = [SHHealthButton buttonWithType:UIButtonTypeCustom];
    _mityBtn.backgroundColor = colorWithClear;
    _mityBtn.frame = CGRectMake(_selectBtn.right + APP_SPACE(10), bgView.bottom + APP_SPACE(15), APP_SPACE(50), APP_SPACE(25));
    _mityBtn.tag = 1004;
    [_mityBtn addTarget:self action:@selector(bt_action_right:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_mityBtn];
    _mityBtn.nameLabel.text = NSLocalizedString(@"匿名", nil);
    _mityBtn.nameLabel.font = Font_Small;
    _mityBtn.nameLabel.textColor = colorWith04;
    size = [LYGlobalDefine getTextContent:_mityBtn.nameLabel.text withFont:_mityBtn.nameLabel.font];
    _mityBtn.nameLabel.frame = CGRectMake((_mityBtn.width - size.width)/2, (_mityBtn.height - size.height)/2, size.width, size.height);
    [_mityBtn addSubview:_mityBtn.nameLabel];
    image = [UIImage imageNamed:@"health_approve"];
    _mityBtn.iconImageView.image = image;
    _mityBtn.iconImageView.frame = CGRectMake(_mityBtn.nameLabel.right, _mityBtn.nameLabel.height - image.size.height, image.size.width, image.size.height);
    _mityBtn.iconImageView.hidden = YES;
    [_mityBtn addSubview:_mityBtn.iconImageView];
    //Label---提示
    _finishButton = [[UIButton alloc]init];
    _finishButton.backgroundColor = RGBCOLOR16(0x9ed8f6);
    [_finishButton setTitleColor:colorWithLYWhite forState:UIControlStateNormal];
    [_finishButton setTitle:NSLocalizedString(@"已有%@用户完成咨询", nil) forState:UIControlStateNormal];
    _finishButton.titleLabel.font = Font_Small;
    _finishButton.layer.cornerRadius = 6.0f;
    [_finishButton addTarget:self action:@selector(finishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _finishButton.layer.masksToBounds = YES;
    size = [JFrame getStringFrame:_finishButton.titleLabel.text font:_finishButton.titleLabel.font width:MAXFLOAT].size;
    _finishButton.frame = CGRectMake(SCREEN_WIDTH - size.width - APP_SPACE(10), _mityBtn.bottom-20 , size.width, size.height);
    [self.scrollView addSubview:_finishButton];
    //_mityBtn.bottom+APP_SPACE(20)
    
    
    //底部照片
    self.ImageContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, 80)];
    self.ImageContentView.top = _finishButton.bottom +5;
    [self.scrollView addSubview:self.ImageContentView];
    
    self.imageArr=[[NSMutableArray alloc] init];
}

#pragma mark 重新布局
-(void)setPicView
{
    CGFloat distance_Y=10;
    CGFloat distance_X=20;
    CGPoint pt;
    //将所有button 删除 重新添加
    NSArray*subviews= self.ImageContentView.subviews;
    for (id subview in subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [subview removeFromSuperview];
        }
    }
    
    for (int i=0; i<self.imageArr.count; i++) {
        UIButton *imageButton=[UIButton buttonWithType:0];
        [imageButton setImage:self.imageArr[i] forState:0];
        [imageButton addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        imageButton.tag=i;
        [self.ImageContentView addSubview:imageButton];
        
        if (i==0) {
            pt.x=distance_X;
            pt.y=distance_Y;
        }
        if (pt.x>300) {
            pt.x=distance_X;
            pt.y=pt.y+ 55 + distance_Y;
            
        }
        //调整imageButton的位置
        imageButton.frame=CGRectMake(pt.x , pt.y , 55, 55);
        
        pt.x +=55+distance_X;
        
        
        // 调整 添加按钮的位置
//        if (i==self.imageArr.count-1) {
//            if (pt.x>300) {
//                pt.x=distance_X;
//                pt.y=pt.y+ 55 + distance_Y;
//                
//            }
//            
//            self.addImageBtn.frame=CGRectMake(pt.x , pt.y , 55, 55);
//            [self.ImageContentView addSubview:self.addImageBtn];
//        }
    }
    
//    if (self.imageArr.count==0) {
//        pt.x=distance_X;
//        pt.y=distance_Y;
//        self.addImageBtn.frame=CGRectMake(pt.x , pt.y , 55, 55);
//        [self.ImageContentView addSubview:self.addImageBtn];
//    }
    
    
    CGRect frame=self.ImageContentView.frame;
    self.ImageContentView.frame=CGRectMake(frame.origin.x, frame.origin.y, 320, pt.y+55+distance_Y +8+32);

    
    self.scrollView.contentSize=CGSizeMake(320, 68+CGRectGetMaxY(self.ImageContentView.frame)+20);
    
    
}




#pragma mark ---data
- (void)initData
{
    
    //初始化一些数据
    self.isAnonymousNum=@"1";//默认为不匿名
    
    self.patientSexNum=@"-1";//需要选择男女 0男 1女
    
    
}
#pragma mark 上传数据
//免费咨询
- (void)upLoadData
{

    if (!ISLOGIN) {
        LoginViewController *loginVC = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
        loginVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:loginVC animated:YES];
        
        return;
    }
    
    
    NSDictionary *dic=@{@"userId":USERID,@"isAnonymous":self.isAnonymousNum,@"patientSex":self.patientSexNum,@"patientAge":self.patientAgeNum,@"patientQuest":self.patientQuestStr};
    
    
    [MBHud showInView:self.view withTitle: NSLocalizedString(@"请稍等...", nil)];
    
    [AFHTTPClient postJSONPath:SHINTERFACE_freeConsult httpHost:sexHealthIP parameters:dic success:^(id responseObject) {
        
        NSDictionary *tempDic=[AFHTTPClient jsonTurnToDictionary:responseObject];
        
        NSLog(@"数据=%@",tempDic);
        
        if(tempDic[@"datasource"] && [tempDic[@"datasource"] isKindOfClass:[NSString class]])
        {
            [ShareFunction showToast:tempDic[@"datasource"]];
            
        }
        
        //成功返回
        if([tempDic[@"success"] integerValue ]==1)
        {
            //返回
            [self performSelector:@selector(bt_action_left) withObject:nil afterDelay:1];
        }
        
        [MBHud removeFromView:self.view];
    } fail:^{
        
        [MBHud removeFromView:self.view];
    }];
    
    
}

#pragma mark ---action 事件
- (void)bt_action_left
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bt_action_right:(UIButton *)sender
{
    NSInteger index = sender.tag;
    if (index == 1000) {//男
        if (_manBtn.selected == NO) {
            _manBtn.selected = YES;
            _womanBtn.selected = NO;
            
            self.patientSexNum = @"0";//男
            
        } else {
            _manBtn.selected = NO;
            _womanBtn.selected = YES;
            
            self.patientSexNum = @"1";//女
        }
    } else if(index == 1001) {//女
        if (_womanBtn.selected == NO) {
            _womanBtn.selected = YES;
            _manBtn.selected = NO;
            
            self.patientSexNum = @"1";
        } else {
            _womanBtn.selected = NO;
            _manBtn.selected = YES;
            
            self.patientSexNum = @"0";//男
        }
    } else if(index == 1002) {
        
    }else if(index == 1003) {//选择医师
        
        [SHNearbyDoctorVC gotoMySelf:self];
        
    }else if(index == 1004) {//匿名
        if (_mityBtn.selected == NO) {
            _mityBtn.selected = YES;
            _mityBtn.iconImageView.hidden = NO;
            
            self.isAnonymousNum = @"0";//匿名
        } else {
            _mityBtn.selected = NO;
            _mityBtn.iconImageView.hidden = YES;
            
            self.isAnonymousNum = @"1";//匿名
        }
        
    } else if(index == 1005) {
        [SHBuyServeVC gotoMySelf:self];
        
        
        
    } else if (index ==1006)//提交
    {
        if(self.type == SHExternalTypeVip)
        {
            
            if(!self.selectDoctor)
            {
                [ShareFunction showToast:@"请选择医师"];
//                return;
            }
            
            
            [SHBuyServeVC gotoMySelf:self];
            return;
        }

        
        //咨询的内容
        if([NSString clearWhiteSpace: _textView.text ].length==0)
        {
            [ShareFunction showToast:@"请输入要咨询的内容"];
            return;
        }else
        {
            self.patientQuestStr=_textView.text;
        }
        
        //年龄
        if(_textField.text.length ==0)
        {
            [ShareFunction showToast:@"请输入年龄"];
            return;
        }else
        {
            self.patientAgeNum=_textField.text;
        }
        
        //性别
        if([self.patientSexNum isEqualToString:@"-1"])
        {
            [ShareFunction showToast:@"请选择性别"];
            return;
        }
        
        
        
        NSLog(@"%@ %@ %@ %@",self.patientQuestStr,self.patientAgeNum,self.isAnonymousNum,self.patientSexNum);
        if(self.type==SHExternalTypeFree)//免费咨询
        {
            [self upLoadData];
        }else if((self.type==SHExternalTypeVip))//VIP咨询
        {
            [self upLoadData];
        }else
        {
            
        }
        
        
    }
}
-(void)photoBtn_click
{

    
    if (self.imageArr.count<9) {
        UIActionSheet *picActinon = [[UIActionSheet alloc]
                                     initWithTitle:nil
                                     delegate:self
                                     cancelButtonTitle:@"取消"
                                     destructiveButtonTitle:nil
                                     otherButtonTitles: @"照相机", @"本地相册",nil];
        
        [picActinon showInView:self.view];
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"图片数量不能超过9张" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



#pragma mark ---actionSheet-touch事件

#pragma mark - photo
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //呼出的菜单按钮点击后的响应
    
    switch (buttonIndex)
    {
        case 0:  //打开照相机拍照
            [self takePhoto];
            break;
            
        case 1:  //打开本地相册
            [self LocalPhoto];
            break;
    }
    
}
//打开本地相册
-(void)LocalPhoto
{
    
    CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    picker.maximumNumberOfSelection = 9-self.imageArr.count;
    //    picker.navigationBar.hidden = NO;
    picker.assetsFilter = [ALAssetsFilter allAssets];
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
#pragma mark - Assets Picker Delegate

- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
   
    
    for (ALAsset *asset in assets){
        if (self.imageArr.count>=9) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"图片数量不能超过9张" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
            //设置一下显示的图片
            [self setPicView];
            return;
        }
        [self.imageArr addObject:[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage]]; //完全分辨率的图片 耗内存，此处使用全屏图片
        
        
    }
    
    //设置一下显示的图片
    [self setPicView];
}

-(void)imageBtnClick:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"是否删除该图片" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    alert.tag=1000+[(UIButton*)sender tag];
    [alert show];
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag>=1000) {
        if (buttonIndex==1) {
            [self.imageArr removeObjectAtIndex:alertView.tag-1000];
            [self setPicView];
        }
    }
}


//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
//        [self presentModalViewController:picker animated:YES];
        [self presentViewController:picker animated:YES
                         completion:^{
                             
                         }];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}


//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        // 先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        // 关闭相册界面
//        [picker dismissModalViewControllerAnimated:YES];
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        // 缩放并添加到数值
        UIImage *newImage = [self scaleImage:image toScaleWidth:320];
        [self.imageArr addObject:newImage];
        [self setPicView];
        
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
//    [picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}







//
//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex==0)
//    {
//        //从照片中选择
//        NSLog(@"从照片中选择");
//        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
//        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
//            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
//            
//        }
//        pickerImage.delegate = self;
//        pickerImage.allowsEditing = YES;
//        //picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        [self presentModalViewController:pickerImage animated:YES];
//        
//    }
//    else if (buttonIndex==1)
//    {
//        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
//        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
//        {
//            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//            picker.delegate = self;
//            //设置拍照后的图片可被编辑
//            picker.allowsEditing = YES;
//            picker.sourceType = sourceType;
//            [self presentModalViewController:picker animated:YES];
//        }else
//        {
//            NSLog(@"模拟其中无法打开照相机,请在真机中使用");
//        }
//    }
//    else if (buttonIndex==2)
//    {
//        //取消
//        NSLog(@"取消");
//    }
//
//}
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    NSString *type=[info objectForKey:UIImagePickerControllerMediaType];
//    if ([type isEqualToString:@"public.image"]) {
//        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//        
//        NSData *data;
//        if (UIImagePNGRepresentation(image)==nil) {
//            data =UIImageJPEGRepresentation(image, 1.0);
//            
//        }
//        else
//        {
//            data = UIImagePNGRepresentation(image);
//        }
//        NSString *DocumentsPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        
//        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
//        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
//        self.filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
//        [picker dismissModalViewControllerAnimated:YES];
//        
//        _imageView.image=image;
//        
//        
//        
//    }
//}
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    NSLog(@"您取消了选择图片");
//    [picker dismissModalViewControllerAnimated:YES];
//}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// 压缩图片

-(UIImage*)imageWithImage:(UIImage*)image
             scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 比例缩放
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

// 比例缩放
- (UIImage *)scaleImage:(UIImage *)image toScaleWidth:(float)width
{
    UIGraphicsBeginImageContext(CGSizeMake(width,image.size.height*width/image.size.width));
    [image drawInRect:CGRectMake(0, 0, width, image.size.height*width/image.size.width)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}



#pragma mark ---didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---gotoMySelf
+(void)gotoMySelf:(id)pvc withType:(SHExternalType)type
{
    if (pvc == nil) {
        return;
    }
    SHVIPVC* vc = [[SHVIPVC alloc]init];
    vc.type = type;
    if ([pvc isKindOfClass:[UINavigationController class]]) {
        [pvc pushViewController:vc animated:YES];
    } else if ([pvc isKindOfClass:[UIViewController class]]) {
        UIViewController *uvc = pvc;
        [uvc.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark ---UItextViewDelegate
- (void) textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [_label setHidden:NO];
    }else{
        [_label setHidden:YES];
    }
}
#pragma mark - acton
- (IBAction)finishButtonClick:(id)sender{
    SHConsultingViewController *vc = [[SHConsultingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
