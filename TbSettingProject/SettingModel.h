//
//  SettingModel.h
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#import <Foundation/Foundation.h>
@class SubMenuModel;

NS_ASSUME_NONNULL_BEGIN

@interface SubMenuModel : NSObject
@property (nonatomic, copy) NSString * imageTitle;
@property (nonatomic, copy) NSString * imageName;
@end


@interface SettingModel : NSObject
@property (nonatomic, copy) NSString * headerTitle;

@property (nonatomic, strong) NSArray <SubMenuModel *>*subMenus;

@end

NS_ASSUME_NONNULL_END
