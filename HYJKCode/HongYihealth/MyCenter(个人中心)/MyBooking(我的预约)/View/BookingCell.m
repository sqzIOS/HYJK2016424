//
//  BookingCell.m
//  
//
//  Created by wenzhizheng on 16/1/3.
//
//

#import "BookingCell.h"

@interface BookingCell ()

@property (nonatomic,weak) UILabel *patientName;
@property (nonatomic,weak) UILabel *progress;
@property (nonatomic,weak) UILabel *doctorName;
@property (nonatomic,weak) UIImageView *doctorPhoto;
@property (nonatomic,weak) UILabel *doctorDetail;
@property (nonatomic,weak) UILabel *treatDay;
@property (nonatomic,weak) UILabel *treatTime;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) UIImageView *rightImage;
@property (nonatomic,weak) UIButton *setClockBtn;
@property (nonatomic) BOOL isNeedClock;

@end

@implementation BookingCell


+ (instancetype)bookingCellWithTableView:(UITableView *)tableView andIsNeedClock:(BOOL)isNeedClock
{
    BookingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell) {
        return cell;
    }

    cell = [[BookingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.clipsToBounds = YES;
    
    UIView *top = [[UIView alloc] init];
    top.frame = CGRectMake(0,0,SCREEN_WIDTH,10);
    top.backgroundColor = RGBCOLOR(240, 240, 240);
    [cell.contentView addSubview:top];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(10, top.bottom + 10, 50, 20);
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = RGBCOLOR(180, 180, 180);
    nameLabel.text = @"就诊人";
    [cell.contentView addSubview:nameLabel];
    
    UIImageView *rightImage = [[UIImageView alloc] init];
    rightImage.image = [UIImage imageNamed:@"arrow"];
    cell.rightImage = rightImage;
    [cell.contentView addSubview:rightImage];
    
    UILabel *patientName = [[UILabel alloc] init];
    patientName.font = [UIFont systemFontOfSize:14];
    cell.patientName = patientName;
    [cell.contentView addSubview:patientName];
    
    UILabel *progress = [[UILabel alloc] init];
    progress.font = [UIFont systemFontOfSize:14];
    progress.textColor =  RGBCOLOR(84,198, 117);
    cell.progress = progress;
    progress.textAlignment = NSTextAlignmentRight;
    [cell.contentView addSubview:progress];
    
    UIView *line = [[UIView alloc] init];
    cell.line = line;
    line.backgroundColor = RGBCOLOR(240, 240, 240);
    [cell.contentView addSubview:line];
    
    UILabel *doctorName = [[UILabel alloc] init];
    doctorName.font = [UIFont systemFontOfSize:14];
    cell.doctorName = doctorName;
    [cell.contentView addSubview:doctorName];

    UIImageView *doctorPhoto = [[UIImageView alloc] init];
    doctorPhoto.clipsToBounds = YES;
    cell.doctorPhoto = doctorPhoto;
    [cell.contentView addSubview:doctorPhoto];

    UILabel *doctorDetail = [[UILabel alloc] init];
    doctorDetail.font = [UIFont systemFontOfSize:14];
    doctorDetail.textColor = RGBCOLOR(180, 180, 180);
    doctorDetail.numberOfLines = 0;
    cell.doctorDetail = doctorDetail;
    [cell.contentView addSubview:doctorDetail];

    UILabel *treatDay = [[UILabel alloc] init];
    treatDay.font = [UIFont systemFontOfSize:12];
    treatDay.textColor = RGBCOLOR(210, 210, 210);
    cell.treatDay = treatDay;
    [cell.contentView addSubview:treatDay];

    UILabel *treatTime = [[UILabel alloc] init];
    treatTime.font = [UIFont systemFontOfSize:12];
    treatTime.textColor = RGBCOLOR(100, 100, 100);
    cell.treatTime = treatTime;
    [cell.contentView addSubview:treatTime];

    cell.isNeedClock = isNeedClock;
    if (isNeedClock == YES) {
        UIView *clockView = [[UIView alloc] init];
        clockView.frame = CGRectMake(0, 171, SCREEN_WIDTH, 29);
        [cell.contentView addSubview:clockView];
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
        line.backgroundColor = RGBCOLOR(240, 240, 240);
        [clockView addSubview:line];
        
        UIButton *button = [[UIButton alloc] init];
        cell.setClockBtn = button;
        [clockView addSubview:button];
        button.frame = CGRectMake(0, 2, SCREEN_WIDTH, 27);
        [button setTitle:@"设置预约闹铃" forState:UIControlStateNormal];
        [button setTitleColor:RGBCOLOR(84,198, 117) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:cell action:@selector(setClock) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.patientName.frame = CGRectMake( 60, 20, 70, 20);
    self.progress.frame = CGRectMake(self.patientName.right, self.patientName.top,SCREEN_WIDTH - self.patientName.right - 20, self.patientName.height);
    self.line.frame = CGRectMake(5, self.patientName.bottom + 15, SCREEN_WIDTH - 10, 1);
    self.rightImage.frame = CGRectMake(self.progress.right + 5, self.patientName.top + 5, 5, 10);
    self.doctorPhoto.frame = CGRectMake(10, self.line.bottom + 5,80, 80);
    self.doctorPhoto.layer.cornerRadius = self.doctorPhoto.frame.size.width / 2;
    self.doctorName.frame = CGRectMake(self.doctorPhoto.right + 10, self.doctorPhoto.top + 15, SCREEN_WIDTH - self.doctorPhoto.right - 20, 14);
    self.doctorDetail.frame = CGRectMake(self.doctorName.left, self.doctorName.bottom, SCREEN_WIDTH - self.doctorName.left - 10, 40);
    self.treatDay.frame = CGRectMake(self.doctorPhoto.left - 5, self.doctorPhoto.bottom + 5, self.doctorPhoto.width + 20, 20);
    self.treatTime.frame = CGRectMake(self.treatDay.right, self.treatDay.top, self.treatDay.width, self.treatDay.height);
}

- (void)setModel:(BookingModel *)model
{
    _model = model;
    self.patientName.text = model.patientName;
    self.doctorName.text = model.doctorName;
    self.doctorDetail.text = model.doctorDetail;
    self.treatDay.text = model.treatDay;
    self.treatTime.text = model.treatTime;
    self.progress.text = model.progress;
    [self.doctorPhoto sd_setImageWithURL:[NSURL URLWithString:model.doctorPhoto]];
}

- (void)setClock
{
    if ([self.delegate respondsToSelector:@selector(bookingCellSetClock:)]) {
        [self.delegate bookingCellSetClock:self];
    }
}

- (void)setNotiTimeHour:(int)hour minute:(int)minute
{
    if (self.isNeedClock) {
        NSString *title = [NSString stringWithFormat:@"%02d : %02d",hour,minute];
        [self.setClockBtn setTitle:title forState:UIControlStateNormal];
    }
}

@end
