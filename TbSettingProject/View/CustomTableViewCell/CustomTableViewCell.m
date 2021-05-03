//
//  CustomTableViewCell.m
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#define  ATdeviceScaleWidth  [UIScreen mainScreen].bounds.size.width
#define  ATdeviceScaleHight  [UIScreen mainScreen].bounds.size.height

#import "CustomTableViewCell.h"
#import <Masonry/Masonry.h>
#import "CustomCollectionViewCell.h"
#import "UIResponder+LSRouter.h"
@interface CustomTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate>


@property (nonatomic, strong)UIView *containerView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UICollectionView *collectionView;


@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self setupSubViewLayout];
    }
    return self;
}

- (void)setupSubViewLayout {
    
    [self.contentView addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
    }];
    
    [self.containerView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containerView.mas_left).mas_offset(15);
        make.top.mas_equalTo(self.containerView.mas_top).mas_offset(15);
        make.height.mas_equalTo(30);
    }];
    
    [self.containerView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.containerView.mas_right).mas_offset(-15);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).mas_offset(-15);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(0);
    }];
    
}

#pragma mark - Collection view data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.settingModel.subMenus.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageModel = self.settingModel.subMenus[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SubMenuModel *model = self.settingModel.subMenus[indexPath.item];
    [self routerEventName:@"didSelectItem" routerInfo:@{@"data" : model}];
    
}

//- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(ATdeviceScaleWidth, section == 0 ? 185 + 25 : 25);
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(ATdeviceScaleWidth, 16);
//}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//
//        LSNewMineHeaderView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//        reusableView.heightConstraint.constant = (indexPath.section == 0 ? 185  : 0);
//        reusableView.topView.hidden = !(indexPath.section == 0);
//        [reusableView layoutIfNeeded];
//        return reusableView;
//    } else if([kind isEqualToString:UICollectionElementKindSectionFooter]) {
//        CollectionFooterReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
//        return reusableView;
//    }
//    return nil;
//}

#pragma mark - Setter && Getter

- (void)setSettingModel:(SettingModel *)settingModel {
    _settingModel = settingModel;
    
    self.titleLabel.text = _settingModel.headerTitle;
    [self.collectionView reloadData];
    
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((ATdeviceScaleWidth - 15 *4) / 4, 80) ;
//        layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;

//        [_collectionView registerNib:[UINib nibWithNibName:@"LSNewMineHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
//        [_collectionView registerClass:[CollectionFooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    }
    return _titleLabel;
}

- (UIView *)containerView {
    if (!_containerView) {
        UIView *containerView = [UIView new];
        containerView.backgroundColor = [UIColor whiteColor];
        containerView.layer.cornerRadius = 12.f;
        containerView.layer.masksToBounds = YES;
        _containerView = containerView;
    }
    return _containerView;
}

@end
