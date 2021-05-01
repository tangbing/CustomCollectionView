//
//  CustomCollectionViewCell.m
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#import "CustomCollectionViewCell.h"
#import <Masonry/Masonry.h>


@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return  self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"my_other_recommended"]];
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(28, 28));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(10);
    }];
    
    UILabel *label = [UILabel new];
    label.text = @"你好呀哈哈";
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(imageView.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(20);
    }];
    
}



@end
