//
//  CustomCollectionViewCell.m
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#import "CustomCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "UIResponder+LSRouter.h"
@interface CustomCollectionViewCell()
@property (nonatomic, strong)UIImageView * imageView;
@property (nonatomic, strong)UILabel * label;
@end

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
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    [self.contentView addSubview:imageView];
    _imageView = imageView;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(28, 28));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(10);
    }];
    
    UILabel *label = [UILabel new];
    [self.contentView addSubview:label];
    _label = label;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_imageView);
        make.top.mas_equalTo(imageView.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(20);
    }];
    
}

- (void)tap:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self routerEventName:@"clickImageTap" routerInfo:@{@"data" : _imageModel}];
}

- (void)setImageModel:(SubMenuModel *)imageModel {
    _imageModel = imageModel;
    
    [_imageView setImage:[UIImage imageNamed:_imageModel.imageName]];
    
    _label.text = _imageModel.imageTitle;
    
}



@end
