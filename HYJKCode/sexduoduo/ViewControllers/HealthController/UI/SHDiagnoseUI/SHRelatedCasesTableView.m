//
//  SHRelatedCasesTableView.m
//  sexduoduo
//
//  Created by shown on 15/9/6.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "SHRelatedCasesTableView.h"
#import "SHMessageCell.h"
#define padding 20    //聊天对话框之间得间隔。
@implementation SHRelatedCasesTableView

- (id)initWithTableViewWithFrame:(CGRect)frame withVC:(UIViewController*)VC withType:(NSInteger)type
{
    if(self = [super init]) {
        [self initView];
        self.backgroundColor = GRAY_COLOR_BG;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableHeaderView=self.casesTableHeaderView;
        self.dataSource = self;
        self.delegate = self;
        self.frame = frame;
        self.type = type;
        self.mainVC = VC;
        
    }
    return self;
}
- (void)initView
{
    self.casesTableHeaderView=[[SHCasesTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    [self addSubview:self.casesTableHeaderView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (self.listArray.count>0) {
        return self.listArray.count;
//    }
//    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *contentStr= self.listArray[indexPath.row][@"replyContent"];
  
    
    CGSize textSize = {260.0 ,10000.0};
    CGSize size =[NSString getTextMultilineContent:contentStr withFont:[UIFont fontWithName:k_Font size:13] withSize:textSize];
    
    size.height += padding*3;
    CGFloat height = size.height < 65 ? 65 : size.height;
    
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHMessageCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SHMessageCell"];
    if (!cell)
    {
        cell=[[SHMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SHMessageCell"];
        
    }
    
    NSDictionary *dic=self.listArray[indexPath.row];
    
    NSString *contentStr= dic[@"replyContent"];
    
    cell.messageContentView.text=contentStr;
    cell.backgroundColor = CLEAR_COLOR;
    
    CGSize textSize = {260.0 ,10000.0};
    CGSize size =[NSString getTextMultilineContent:contentStr withFont:[UIFont fontWithName:k_Font size:13] withSize:textSize];
    
    UIImage *bgImage = nil;
    
    //发送消息
    if ([dic[@"isDoctor"] intValue]==1) {
        
        bgImage =[UIImage imageNamed:@"BlueBubble2.png"];
        bgImage =[bgImage setImageCanStretchwithTop:16 bottom:16 left:21 right:21];
        
        [cell.messageContentView setFrame:CGRectMake(padding, padding*2, size.width, size.height)];
        
        [cell.bgImageView setFrame:CGRectMake(cell.messageContentView.left - padding/2, cell.messageContentView.top - padding/2, size.width + padding/2, size.height + padding)];
    }else {
        bgImage =[UIImage imageNamed:@"GreenBubble2.png"];
        bgImage =[bgImage setImageCanStretchwithTop:16 bottom:16 left:21 right:21];
        
        [cell.messageContentView setFrame:CGRectMake(320-size.width - padding, padding*2, size.width, size.height)];
        [cell.bgImageView setFrame:CGRectMake(cell.messageContentView.left - padding/2, cell.messageContentView.top - padding/2, size.width + padding, size.height + padding)];
    }
    
    cell.bgImageView.image = bgImage;
    cell.senderAndTimeLabel.text = [NSString stringWithFormat:@"%@",[NSDate formatTimeStrIntervalSince1970:dic[@"replyCreateDate"] ]];
    
    
    return cell;
}



-(void)setListArray:(NSMutableArray *)listArray
{
    _listArray = [[NSMutableArray alloc] initWithArray:listArray];
    [self reloadData];
}

@end
