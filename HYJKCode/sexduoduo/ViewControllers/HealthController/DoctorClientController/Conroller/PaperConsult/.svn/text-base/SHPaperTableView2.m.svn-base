//
//  SHPaperTableView2.m
//  sexduoduo
//
//  Created by showm on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHPaperTableView2.h"

@implementation SHPaperTableView2


- (id)initWithTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC
{
    
    if(self = [super init]) {
//        self.backgroundColor = [UIColor clearColor];
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.mainVC = VC;
        //        self.rowHeight = kSHCopeCellHeight;
        
        [self setLineZero];
        [self clearDefaultLineByAddFootLine];

        
        self.selectIndex=0;
        
        
    }
    return self;
    
}

-(void)setTvData:(NSDictionary *)tvData
{
    [self initData:tvData];
}
- (void)initData:(NSDictionary*)data
{
    if (_tvData == nil) {
        _tvData = [[NSMutableDictionary alloc]init];
    }
    [_tvData removeAllObjects];
    [_tvData setValuesForKeysWithDictionary:data];
    [self reloadData];
    
}
#pragma mark ---TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_tvData  objectForKey:@"nameArray"]count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (self.selectIndex == section && [[_tvData  objectForKey:@"contentArray"]count]>section) {
        return 1;
    }else return 0;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getCellHeightwithSection:indexPath.section];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 44)];
    view.backgroundColor = WHITE_COLOR;
    if (self.selectIndex == section) {
        view.backgroundColor = colorWith01;
    }
    
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.width, view.height)];
    lab.backgroundColor = CLEAR_COLOR;
    lab.text=[_tvData[@"nameArray"] objectAtIndex:section];
    lab.font = [UIFont fontWithName:k_Font size:15];
    if(self.selectIndex == section)
    {
        lab.textColor = WHITE_COLOR;
    }else
    {
        lab.textColor = colorWith02;
    }
    [view addSubview:lab];
    
    
    UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(self.width - 30, view.height/2. - QZMake(24)/2., QZMake(24), QZMake(24))];
    if (self.selectIndex == section) {
        imageView.image = UIImageByName(@"SHPaper_up");
    }else
    {
        imageView.image = UIImageByName(@"SHPaper_down");
    }
    [view addSubview:imageView];
    
    
    
    UIButton *btn=[UIButton buttonWithType:0];
    btn.frame = view.frame;
    [view addSubview:btn];
    btn.tag = section;
    [btn addTarget:self action:@selector(sectionHeadClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return view;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showUserInfoCellIdentifier = @"SHPaperCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(QZMake(10), 10, k_screenWidth-QZMake(20), 100)];
        contentLab.font = [UIFont fontWithName:k_Font size:12];
        contentLab.tag = 1001;
        contentLab.numberOfLines = 0;
        [cell addSubview:contentLab];
    }
    
    NSArray *subArray = _tvData[@"contentArray"];
    
    UILabel *contentLab = (UILabel *)[cell viewWithTag:1001];
    
    CGFloat height =[self getContentLabHeight:indexPath.section];
    
    contentLab.height = height;
    if (subArray.count>indexPath.row) {
        contentLab.text =subArray[indexPath.section];
    }else contentLab.text = @"无数据";
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - action
-(void)sectionHeadClick:(UIButton *)sender
{
    NSInteger index= sender.tag;
    
    if (self.selectIndex !=index) {
        self.selectIndex= index;
    }else self.selectIndex = -1;
    
    [self reloadData];
    
}


-(CGFloat )getCellHeightwithSection:(NSInteger )section
{
    CGFloat cellHeight;
    
    cellHeight = [self getContentLabHeight:section] +10 +10;
    
    return cellHeight;
}

-(CGFloat)getContentLabHeight:(NSInteger)section
{
    CGFloat cellHeight;
    
    NSString *contentStr=_tvData[@"contentArray"][section];
    CGSize size=[NSString getTextMultilineContent:contentStr withFont:[UIFont fontWithName:k_Font size:12] withSize:CGSizeMake(k_screenWidth-QZMake(20), 1000)];
    
    cellHeight = size.height ;
    
    return cellHeight;
}


@end
