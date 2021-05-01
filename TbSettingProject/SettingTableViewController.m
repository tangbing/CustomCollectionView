//
//  SettingTableViewController.m
//  TbSettingProject
//
//  Created by Tb on 2021/4/30.
//


#define  ATdeviceScaleWidth  [UIScreen mainScreen].bounds.size.width
#define  ATdeviceScaleHight  [UIScreen mainScreen].bounds.size.height
#define kSpace 16


#import "SettingTableViewController.h"
#import "CustomCollectionViewCell.h"
#import "TBFooterCollectionReusableView.h"
#import "CollectionFooterReusableView.h"
//#import "SectionBgCollectionViewLayout.h"
#import "TbSettingProject-Swift.h"
#import <Masonry/Masonry.h>
#import "LSNewMineHeaderView.h"
@interface SettingTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,SectionBgCollectionViewDelegate>

@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation SettingTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(16);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-16);
        make.bottom.mas_equalTo(self.view.safeAreaInsets.bottom);
        make.top.mas_equalTo(self.view.safeAreaInsets.top);

    }];
}

#pragma mark - Collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (UIColor *)collectionView:(UICollectionView *)collectionView collectionViewLayout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSectionAt:(int)section {
    return [UIColor purpleColor];
}


- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(ATdeviceScaleWidth, section == 0 ? 185 + 25 : 25);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(ATdeviceScaleWidth, 16);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        LSNewMineHeaderView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        reusableView.heightConstraint.constant = (indexPath.section == 0 ? 185  : 0);
        reusableView.topView.hidden = !(indexPath.section == 0);
        [reusableView layoutIfNeeded];
        return reusableView;
    } else if([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        CollectionFooterReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        return reusableView;
    }
    return nil;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        SectionBgCollectionViewLayout *layout = [[SectionBgCollectionViewLayout alloc] init];
        layout.itemSize = CGSizeMake((ATdeviceScaleWidth - 16 *2) / 4, 58 + 20) ;
        layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"LSNewMineHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_collectionView registerClass:[CollectionFooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}


- (UIColor * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout * _Nonnull)collectionViewLayout backgroundColorForSectionAt:(NSInteger)section {
    return  [UIColor whiteColor];
}


@end
