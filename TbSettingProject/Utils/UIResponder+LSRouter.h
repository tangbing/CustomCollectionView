//
//  UIResponder+LSRouter.h
//  iOSComment
//
//  Created by xunai on 2018/11/7.
//  Copyright © 2018年 xunai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (LSRouter)
/**
 配置路由方法
 @param eventName 路由名称
 @param info 路由信息
 */
- (void)routerEventName:(NSString *)eventName routerInfo:(NSDictionary *)info;


@end
