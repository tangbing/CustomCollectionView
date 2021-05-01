//
//  UIView+Extension.h
//  01-黑酷
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;


/**
 *设置View边角为圆角
 */
- (void)setViewCornerRadius :(int)Radius;

- (void)setViewCornerRadius :(int)Radius Color:(UIColor *)Color Width:(int)Width;
/**
 *解决TableView系统分割线短15像素的bug
 */
+(void)setupTableLine:(UITableView *)tableview;
@end
