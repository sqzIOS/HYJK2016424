//
//  AddressModel.h
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能:address model

#import <Foundation/Foundation.h>

@interface AddressModel : NSObject

@property (nonatomic, copy) NSString *titleName;

@property (nonatomic, copy) NSString *addressName;

@property (nonatomic, copy) NSString *hospitalName;

@property (nonatomic, assign) BOOL isSelected;

@end
