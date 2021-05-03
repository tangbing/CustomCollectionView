//
//  UIResponder+LSRouter.m
//  iOSComment
//
//  Created by xunai on 2018/11/7.
//  Copyright © 2018年 xunai. All rights reserved.
//

#import "UIResponder+LSRouter.h"

@implementation UIResponder (LSRouter)


- (void)routerEventName:(NSString *)eventName routerInfo:(NSDictionary *)info {
    
    
     [self.nextResponder routerEventName:eventName routerInfo:info];
    
}


@end
