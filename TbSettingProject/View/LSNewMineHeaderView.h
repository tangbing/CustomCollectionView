//
//  LSNewMineHeaderView.h
//  FindAiReconfiguration_ Project
//
//  Created by xunai on 2019/7/25.
//  Copyright © 2019 FandAi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSMyCenterInfoDataModel;
NS_ASSUME_NONNULL_BEGIN
@interface LSNewMineHeaderView : UICollectionReusableView

+ (instancetype)initNewMineHeaderView;

@property (nonatomic , strong)LSMyCenterInfoDataModel *model;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

NS_ASSUME_NONNULL_END
