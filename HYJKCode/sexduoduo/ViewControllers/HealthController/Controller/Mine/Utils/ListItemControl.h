//
//  ListItemControl.h
//  sexduoduo
//
//  Created by 王四的mac air on 15/9/29.
//  Copyright (c) 2015年 dbCode. All rights reserved.
//

#import "HBButton.h"

@interface ListItemControl : HBButton{
    UIImageView *_accessoryView;
    
    UIImageView *_newImgView;
    UILabel *_newNumLabel;
    CellLocation _cellLocation;
    
    AccessoryType _accessoryType;

}


@property (nonatomic, strong) UIImageView *picImgView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, copy) NSString *liner;

- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
              title:(NSString *)title
      hideAccessory:(BOOL)hideAccessory;

- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
              title:(NSString *)title
      hideAccessory:(BOOL)hideAccessory
       cellLocation:(CellLocation)cellLocation;

-(id)initWithFrame:(CGRect)frame
            imgUrl:(NSString *)imgUrl
             title:(NSString *)title
     hideAccessory:(BOOL)hideAccessory
    accessoryType : (AccessoryType)accessoryType
      cellLocation:(CellLocation)cellLocation;

- (void)setTitleColor:(UIColor *)color;

- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
           imgFrame:(CGRect)imgFrame
         titleLable:(UILabel *)titleLabel
          accessory:(UIImageView *)accessory
     accessoryFrame:(CGRect)accessoryFrame;

- (id)initWithFrame:(CGRect)frame
             imgUrl:(NSString *)imgUrl
              title:(NSString *)title
      hideAccessory:(BOOL)hideAccessory
       cellLocation:(CellLocation)cellLocation
              liner:(NSString *)liner;

- (void)setLabFontNotMix;

-(void)hideAccessory;

-(void)showAccessory;

@end
