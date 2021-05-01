//
//  CustomTableViewCell.h
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#import <UIKit/UIKit.h>
#import "SettingModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell
@property (nonatomic, strong)SettingModel *settingModel;

@end

NS_ASSUME_NONNULL_END
