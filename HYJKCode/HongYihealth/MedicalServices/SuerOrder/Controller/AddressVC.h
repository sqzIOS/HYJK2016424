//
//  AddressVC.h
//  
//
//  Created by 刘朝涛 on 16/1/3.
//
//  功能:预约地址

#import <UIKit/UIKit.h>
#import "AddressTableView.h"

@interface AddressVC : MyCenterBaseController

@property (nonatomic, strong) AddressTableView *tableView;

@property (nonatomic, strong) NSString *selectedHospitalName;

@property (nonatomic, strong) NSMutableArray *shopArr;  //医师地址

@end
