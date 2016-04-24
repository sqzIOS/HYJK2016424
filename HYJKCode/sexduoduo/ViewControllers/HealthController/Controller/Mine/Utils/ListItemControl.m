//
//  ListItemControl.m
//  sexduoduo
//
//  Created by 王四的mac air on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "ListItemControl.h"
#import "ViewConstructUtil.h"
#import "SepLineUtil.h"

@implementation ListItemControl

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self constructSubViews];
        _cellLocation = CellLocation_TopAndBottom;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
              title:(NSString *)title
      hideAccessory:(BOOL)hideAccessory{
    self =  [self initWithFrame:frame
                         imgUrl:imgUrl
                          title:title
                  hideAccessory:hideAccessory
                   cellLocation:CellLocation_TopAndBottom];
    return self;
}

- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
              title:(NSString *)title
      hideAccessory:(BOOL)hideAccessory
       cellLocation:(CellLocation)cellLocation{
    self = [self initWithFrame:frame];
    if (self) {
        if (![StringUtil isEmpty:imgUrl]) {
            UIImage *img = [ImageUtil imageNameIPad:imgUrl];
            _picImgView.size = HBSizeMakeIpad(21, 21);
            //如果不是本地图片资源，使用下载方式
            if (img) {
                _picImgView.image = img;
            }
            else{
                [_picImgView hb_setImageURL:imgUrl];
            }
            [UIView setSubviewCenterOnVertical:_picImgView AtX:GTFixWidthFlaot(10) superView:self];
        }
        
        if (![StringUtil isEmpty:title]) {
            _title.text = title;
            [_title sizeToFit];
            [UIView setSubviewCenterOnVertical:_title AtX:_picImgView.right  + (Isipad()?10:0) + GTFixWidthFlaotIpad(10) superView:self];
        }
        
        if (!hideAccessory) {
            [_accessoryView layoutForImage:[UIImage imageNamed:@"MineRightGrayAccessory"]];
            [UIView setSubviewCenterOnVertical:_accessoryView AtX:self.width - _accessoryView.width - GTFixWidthFlaotIpad(10) superView:self];
        }
        
        _cellLocation = cellLocation;
        //        [self handleSepLine];
        [self handleSepLine:(![StringUtil isEmpty:imgUrl])];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
              title:(NSString *)title
      hideAccessory:(BOOL)hideAccessory
       cellLocation:(CellLocation)cellLocation
              liner:(NSString *)liner {
    self = [self initWithFrame:frame];
    if (self) {
        if (![StringUtil isEmpty:imgUrl]) {
            UIImage *img = [ImageUtil imageNameIPad:imgUrl];
            _picImgView.size = HBSizeMakeIpad(21, 21);
            //如果不是本地图片资源，使用下载方式
            if (img) {
                _picImgView.image = img;
            }
            else{
                [_picImgView hb_setImageURL:imgUrl];
            }
            
            [UIView setSubviewCenterOnVertical:_picImgView AtX:GTFixWidthFlaot(10) superView:self];
        }
        
        if (![StringUtil isEmpty:title]) {
            _title.text = title;
            [_title sizeToFit];
            [UIView setSubviewCenterOnVertical:_title AtX:_picImgView.right  + (Isipad()?10:0) + GTFixWidthFlaotIpad(10) superView:self];
        }
        
        if (!hideAccessory) {
            [_accessoryView layoutForImage:[UIImage imageNamed:@"MineRightGrayAccessory"]];
            [UIView setSubviewCenterOnVertical:_accessoryView AtX:self.width - _accessoryView.width - GTFixWidthFlaotIpad(10) superView:self];
        }
        
        _cellLocation = cellLocation;
        _liner = liner;
        //        [self handleSepLine];
        
        [self handleSepLine:(![StringUtil isEmpty:imgUrl])];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
            imgUrl:(NSString *)imgUrl
             title:(NSString *)title
     hideAccessory:(BOOL)hideAccessory
     accessoryType:(AccessoryType)accessoryType
      cellLocation:(CellLocation)cellLocation{
    self = [self initWithFrame:frame];
    if (self) {
        if (![StringUtil isEmpty:imgUrl]) {
            UIImage *img = [ImageUtil imageNameIPad:imgUrl];
            _picImgView.size = HBSizeMakeIpad(21, 21);
            //如果不是本地图片资源，使用下载方式
            if (img) {
                _picImgView.image = img;
            }
            else{
                [_picImgView hb_setImageURL:imgUrl];
            }
            
            [UIView setSubviewCenterOnVertical:_picImgView AtX:GTFixWidthFlaot(10) superView:self];
        }
        
        if (![StringUtil isEmpty:title]) {
            _title.text = title;
            [_title sizeToFit];
            [UIView setSubviewCenterOnVertical:_title AtX:_picImgView.right  + (Isipad()?10:0) + GTFixWidthFlaotIpad(10) superView:self];
        }
        
        _accessoryType = accessoryType;
        if (_accessoryType == AccessoryType_RightGray) {
            [_accessoryView layoutForImageForIpad:[UIImage imageNamed:@"MineRightGrayAccessory"]];
        }else if (_accessoryType == AccessoryType_Yes){
            [_accessoryView layoutForImageForIpad:[UIImage imageNamed:@"MineYesAccessory"]];
        }
        
        if (!hideAccessory) {
            _accessoryView.hidden = NO;
            
        }
        [UIView setSubviewCenterOnVertical:_accessoryView AtX:self.width - _accessoryView.width - 10 superView:self];
        _cellLocation = cellLocation;
        
        //        [self handleSepLine];
        
        [self handleSepLine:(![StringUtil isEmpty:imgUrl])];
    }
    
    return self;
}



- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
           imgFrame:(CGRect)imgFrame
         titleLable:(UILabel *)titleLabel
          accessory:(UIImageView *)accessory
     accessoryFrame:(CGRect)accessoryFrame {
    self = [self initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    if (self) {
        [self addFlagImgView:imgUrl imgFrame:imgFrame];
        [self addTitleLabelWithLabel:titleLabel superFrame:frame];
        [self addAccessoryImgViewWithImg:accessory accessoryFrame:accessoryFrame];
    }
    return self;
}

- (void)constructSubViews{
    _picImgView =  [[UIImageView alloc] initWithFrame:CGRectZero];
    _picImgView.backgroundColor = [UIColor clearColor];
    _picImgView.userInteractionEnabled = NO;
    [self addSubview:_picImgView];
    
    _title = [ViewConstructUtil constructLabel:CGRectZero
                                          text:nil
                                          font:[UIFont systemFontOfSize:12]
                                     textColor:COLOR_TEXT_1];
    [self addSubview:_title];
    _title.textAlignment = NSTextAlignmentLeft;
    
    _accessoryView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _accessoryView.backgroundColor = [UIColor clearColor];
    _accessoryView.userInteractionEnabled = NO;
    [self addSubview:_accessoryView];
    
}

- (void)handleSepLine:(BOOL)hasImg{
    
    [SepLineUtil addSepLine:self
                    forType:_cellLocation
               hasLeftImage:hasImg];
}


- (void)handleSepLine{
    UIImage *middleLine = nil;
    //    if (![StringUtil isEmpty:_liner]) {
    //        middleLine = [UIImage imageNamed:_liner];
    //    } else {
    //        middleLine = [UIImage imageNamed:@"sepLineHorizontal_620"];
    //    }
    [SepLineUtil addSepLine:self
                    forType:_cellLocation
                 middleLine:middleLine];
}

- (void)setTitleColor:(UIColor *)color{
    _title.textColor = color;
}

- (void)setLabFontNotMix{
    _title.font = [UIFont systemFontOfSize:12];
}


- (void)addFlagImgView:(NSString *)imgUrl imgFrame:(CGRect)imgFrame {
    if (![StringUtil isEmpty:imgUrl]) {
        _picImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imgUrl"]];
        _picImgView.frame = imgFrame;
        [self addSubview:_picImgView];
    }
}

- (void)addTitleLabelWithLabel:(UILabel *)label superFrame:(CGRect)frame {
    if (label) {
        _title = label;
        [self addSubview:_title];
    }
}

- (void)addAccessoryImgViewWithImg:(UIImageView *)accessory
                    accessoryFrame:(CGRect)accessoryFrame {
    _accessoryView = accessory;
    _accessoryView.frame = accessoryFrame;
    [self addSubview:_accessoryView];
}

-(void)hideAccessory{
    _accessoryView.hidden = YES;
}

-(void)showAccessory{
    //    [_accessoryView setImage:[UIImage imageNamed:@"MineYesAccessory"]];
    _accessoryView.hidden = NO;
}

@end
