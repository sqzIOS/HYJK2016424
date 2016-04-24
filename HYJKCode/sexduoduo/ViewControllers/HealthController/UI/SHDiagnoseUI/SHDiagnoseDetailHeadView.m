//
//  SHDiagnoseDetailHeadView.m
//  sexduoduo
//
//  Created by showm on 15/9/11.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHDiagnoseDetailHeadView.h"
#import "SHDiagnoseDetailSubVC.h"
@implementation SHDiagnoseDetailHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithVC:(UIViewController *)vc
{
    
    self = [self init];
    if (self !=nil) {
        
        self.mainVC = vc;
        isChangeSelectColor=NO;
    }
    
    
    
    return self;
}


-(id)init
{
    if (self=[super init]) {
        
        dataArray=@[@"疾病说明",@"临床表现",@"病因",@"检查和诊断",@"预防",@"治疗"];
        
        
        UIScrollView *topView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STAR_Y +50, self.width, 40)];
        topView.backgroundColor = UICOLOR_RGB(244, 244, 244);
        
        self.gridView = [[MMGridView alloc] initWithFrame:CGRectMake(20, 5, 280, 40)];
        self.gridView.backgroundColor = CLEAR_COLOR;
        //    self.gridView.numberOfColumns = 1;
        //    self.gridView.numberOfRows = 5;
        self.gridView.dataSource = self;
        self.gridView.delegate = self;
        [topView addSubview:self.gridView];
        
//        CGSize detailSize = [[array firstObject]  sizeWithFont:[UIFont systemFontOfSize:12.0]
//                                                                                           constrainedToSize:CGSizeMake(280, 21)
//                                                                                               lineBreakMode:NSLineBreakByWordWrapping];
        
        //    if (detailSize.width >= 140) {
        //        self.gridView.numberOfColumns = 1;
        //        self.gridView.numberOfRows = self.subClassifyArray.count;
        //
        //        self.gridView.frame = CGRectMake(20, 5, 280, self.subClassifyArray.count * 40 );
        //
        //
        //    }else if (70 <= detailSize.width && detailSize.width < 140) {
        //        self.gridView.numberOfColumns = 2;
        //        self.gridView.numberOfRows = (self.subClassifyArray.count-1) / 2 + 1;
        //        self.gridView.frame = CGRectMake(20, 5, 280, ((self.subClassifyArray.count-1) / 2 + 1) * 40 );
        //
        //
        //    }else if (0 < detailSize.width && detailSize.width < 70)
        //    {
        //        self.gridView.numberOfColumns = 4;
        //        self.gridView.numberOfRows = (self.subClassifyArray.count-1) / 4 + 1;
        //        self.gridView.frame = CGRectMake(20, 5, 280, ((self.subClassifyArray.count-1) / 4 + 1) * 40 );
        //
        //    }
        
        self.gridView.numberOfColumns = 2;
        self.gridView.numberOfRows = (dataArray.count-1) / 2 + 1;
        self.gridView.frame = CGRectMake(20, 5, 280, ((dataArray.count-1) / 2 + 1) * 40 );
        
        topView.frame=CGRectMake(0, 0, k_screenWidth, self.gridView.height +10);
        
        self.frame = topView.frame;
        [self addSubview:topView];
        
        
        
    }
    return self;
}

- (NSInteger)numberOfCellsInGridView:(MMGridView *)gridView
{
    
    return dataArray.count;
    
}


- (MMGridViewCell *)gridView:(MMGridView *)gridView cellAtIndex:(NSUInteger)index
{
    
    MMGridViewDefaultCell *cell = [[MMGridViewDefaultCell alloc] initWithFrame:CGRectNull];
    cell.textLabel.text =  [dataArray objectAtIndex:index];
    
    
    cell.backgroundColor=WHITE_COLOR;
    cell.textLabel.font=[UIFont fontWithName:k_Font size:12];
    
    //选中变颜色
    if (isChangeSelectColor && index == _numIndexColor) {
        cell.textLabel.textColor = [UIColor colorWithRed:244/255.f green:45/255.f blue:100/255.f alpha:1.0];
        cell.iconImageVIew.layer.borderColor = [UIColor colorWithRed:244/255.f green:45/255.f blue:100/255.f alpha:1.0].CGColor;
    }else
    {
        cell.textLabel.textColor=UICOLOR_RGB(66, 66, 66);
    }

    
    return cell;
}


#pragma mark  GridView Delegate

- (void)gridView:(MMGridView *)gridView didSelectCell:(MMGridViewCell *)cell atIndex:(NSUInteger)index
{
    NSLog(@"%d",(int)index);
    
    _numIndexColor = (int)index;
    [self.gridView reloadData];
    

    if (self.detailArray) {
        
        NSLog(@"%@",self.detailArray);
        
        [SHDiagnoseDetailSubVC gotoMySelf:self.mainVC WithDetailArray:self.detailArray withIndex:(int)index];
    }
    
    
}

- (void)gridView:(MMGridView *)theGridView changedPageToIndex:(NSUInteger)index
{
    
}


@end
