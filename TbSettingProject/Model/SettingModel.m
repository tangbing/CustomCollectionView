//
//  SettingModel.m
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#import "SettingModel.h"
#import <MJExtension/MJExtension.h>

@implementation SubMenuModel

@end

@implementation SettingModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"subMenus" : [SubMenuModel class]};
}


@end
