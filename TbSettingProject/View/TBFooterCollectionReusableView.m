//
//  TBFooterCollectionReusableView.m
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#import "TBFooterCollectionReusableView.h"

@interface TBFooterCollectionReusableView()
@property (nonatomic, strong)UILabel *titleLabel;


@end

@implementation TBFooterCollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加头(尾)视图中的控件
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreBtnClick)];
//        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(16, 0, 200, 25);
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [self createLabelTextColor:[UIColor lightGrayColor]];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)createLabelTextColor:(UIColor *)textColor {
    UILabel *label = [UILabel new];
    label.numberOfLines = 1;
    label.text = @"其他服务";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = textColor;
    return label;;
}

@end
