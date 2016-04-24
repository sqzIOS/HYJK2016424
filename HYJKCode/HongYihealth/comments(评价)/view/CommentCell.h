//
//  CommentCell.h
//  
//
//  Created by apple on 16/1/29.
//
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"


@protocol CommentCellDelegate <NSObject>

- (void)commentCellSubmitBtnClickWithDict:(NSDictionary *)dict;

@end

@interface CommentCell : UITableViewCell

@property (nonatomic,weak) id<CommentCellDelegate> delegate;

@property (nonatomic,copy) NSString *deseaseName;
@property (nonatomic,copy) NSString *doctorName;
@property (nonatomic,copy) NSString *doctorDetail;
@property (nonatomic,copy) NSString *doctorIcon;

//@property (nonatomic,strong) CommentModel *model;

@end
