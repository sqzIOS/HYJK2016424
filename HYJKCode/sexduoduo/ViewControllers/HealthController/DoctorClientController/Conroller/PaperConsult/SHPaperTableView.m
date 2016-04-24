//
//  SHPaperTableView.m
//  sexduoduo
//
//  Created by showm on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//  

#import "SHPaperTableView.h"

@implementation SHPaperTableView

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
        
//        self.separatorColor = GRAY_COLOR_TABLEVIEWLINE;
        
        [self setLineZero];
        
        [self clearDefaultLineByAddFootLine];
        self.selectIndex=0;
        
        
    }
    return self;
    
}

-(void)setTvData:(NSMutableArray *)tvData
{
    [self initData:tvData];
}
- (void)initData:(NSArray*)data
{
    if (_tvData == nil) {
        _tvData = [[NSMutableArray alloc]init];
    }
    [_tvData removeAllObjects];
    [_tvData addObjectsFromArray:data];
    [self reloadData];
    
}
#pragma mark ---TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tvData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (self.selectIndex == section) {
        return [[[_tvData objectAtIndex:section] objectForKey:@"subArray"] count];
    }else return 0;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
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
    lab.text=_tvData[section][@"name"];
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
    }
   
    NSArray *subArray = _tvData[indexPath.section][@"subArray"];
    cell.textLabel.text =subArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:k_Font size:12];
    
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


@end
