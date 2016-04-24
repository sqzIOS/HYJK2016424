//
//  CommentCell.m
//  
//
//  Created by apple on 16/1/29.
//
//

#import "CommentCell.h"
#import "CommentBar.h"

@interface CommentCell () <CommentBarDelegate>

// 医生信息
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

// 病名
@property (weak, nonatomic) IBOutlet UILabel *deseaseLabel;

// 评分条区域
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

// 评分值
@property (nonatomic) int values1;
@property (nonatomic) int values2;
@property (nonatomic) int values3;

// 评分条
@property (nonatomic,weak) CommentBar *bar1;
@property (nonatomic,weak) CommentBar *bar2;
@property (nonatomic,weak) CommentBar *bar3;


@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)submitBtnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation CommentCell

- (void)awakeFromNib {
    
    CommentBar *bar1 = [CommentBar commentBarWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width - 200, 20) andMargin:10];
    bar1.tag = 1;
    self.bar1 = bar1;
    bar1.delegate = self;
    [self.view1 addSubview:bar1];
    
    CommentBar *bar2 = [CommentBar commentBarWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width - 200, 20) andMargin:10];
    bar2.tag = 2;
    self.bar2 = bar2;
    bar2.delegate = self;
    [self.view2 addSubview:bar2];
    
    CommentBar *bar3 = [CommentBar commentBarWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width - 200, 20) andMargin:10];
    bar3.tag = 3;
    self.bar3 = bar3;
    bar3.delegate = self;
    [self.view3 addSubview:bar3];

    self.iconView.layer.cornerRadius = 28;
    self.iconView.clipsToBounds = YES;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = RGBCOLOR(230, 230, 230).CGColor;
    
    self.submitBtn.backgroundColor = MAINCOLOR;
    self.submitBtn.layer.cornerRadius = 5;
    self.submitBtn.clipsToBounds = YES;
}


#pragma mark - commentBar代理
- (void)commentBar:(CommentBar *)commentBar didSetValue:(int)value
{
    if (commentBar.tag == 1) {
        self.values1 = value;
    }
    if (commentBar.tag == 2) {
        self.values2 = value;
    }
    if (commentBar.tag == 3) {
        self.values3 = value;
    }
}

#pragma mark - 设置页面数据
- (void)setDeseaseName:(NSString *)deseaseName
{
    _deseaseName = deseaseName;
    self.deseaseLabel.text = deseaseName;
}

- (void)setDoctorName:(NSString *)doctorName
{
    _doctorName = doctorName;
    self.label1.text = doctorName;
}

- (void)setDoctorDetail:(NSString *)doctorDetail
{
    _doctorDetail = doctorDetail;
    self.label2.text = doctorDetail;
}

- (void)setDoctorIcon:(NSString *)doctorIcon
{
    _doctorIcon = doctorIcon;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:doctorIcon]];
}

#pragma mark - 提交
- (IBAction)submitBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(commentCellSubmitBtnClickWithDict:)]) {
        NSDictionary *dict = @{@"effect_rank":@(self.values1),
                               @"attitude_rank":@(self.values2),
                               @"recommend_rank":@(self.values3),
                               @"comment":self.textView.text};
        
        NSLog(@"%@",dict);
        
        [self.delegate commentCellSubmitBtnClickWithDict:dict];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

//#pragma mark 设置数值
//- (void)setValues1:(int)values1
//{
//    self.bar1.value = values1;
//}
//- (void)setValues2:(int)values2
//{
//    self.bar2.value = values2;
//}
//- (void)setValues3:(int)values3
//{
//    self.bar3.value = values3;
//}
//
//- (void)setModel:(CommentModel *)model
//{
//    _model = model;
//    self.submitBtn.hidden = YES;
//    
//    NSString *text = model.content;
//    self.textView.text = text;
//    
//    self.values1 = model.effect_rank.intValue;
//    self.values2 = model.attitude_rank.intValue;
//    self.values3 = model.recommend_rank.intValue;
//
//}

@end
