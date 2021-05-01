//
//  LSNewMineHeaderView.m
//  FindAiReconfiguration_ Project
//
//  Created by xunai on 2019/7/25.
//  Copyright © 2019 FandAi. All rights reserved.
//

#import "LSNewMineHeaderView.h"
//#import "UIImageView+SDImageShield.h"
//#import "UIResponder+LSRouter.h"

//#import "LSCaseKingManager.h"
@interface LSNewMineHeaderView()

@property (weak, nonatomic) IBOutlet UIView *topShadowView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UIImageView *crownImageView;
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
@property (weak, nonatomic) IBOutlet UIButton *attendBtn;
@property (weak, nonatomic) IBOutlet UIButton *fansBtn;
@property (weak, nonatomic) IBOutlet UIButton *energyBtn;
@property (weak, nonatomic) IBOutlet UILabel *collectLabel;
@property (weak, nonatomic) IBOutlet UILabel *attendLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UILabel *energyLabel;
@property (weak, nonatomic) IBOutlet UIView *energyRedDot;
@property (weak, nonatomic) IBOutlet UIButton *emblemBtn;
@property (weak, nonatomic) IBOutlet UIButton *gradeBtn;



@end
@implementation LSNewMineHeaderView

+ (instancetype)initNewMineHeaderView {
    
    return [[UINib nibWithNibName:@"LSNewMineHeaderView" bundle:nil] instantiateWithOwner:self options:nil].firstObject;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor lightGrayColor];
    self.topShadowView.backgroundColor = [UIColor clearColor];
    self.topView.backgroundColor = [UIColor clearColor];

    
//    _topShadowView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
//    _topShadowView.layer.cornerRadius = 8;
//    _topShadowView.layer.shadowColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0].CGColor;
//    _topShadowView.layer.shadowOffset = CGSizeMake(0,2);
//    _topShadowView.layer.shadowOpacity = 1;
//    _topShadowView.layer.shadowRadius = 20;
    //_crownImageView.hidden = ![LSCaseKingManager iamCaseKing];
    
}

//- (void)setModel:(LSMyCenterInfoDataModel *)model {
//    _model = model;
//    [self.iconImageView ls_setImageWithURLString:[LSLoginDataModel getUserInfoDatas].userInfo.userPic placeholderImageName:@"default_avatar_small" isAvatar:YES cornerRadius:0];
//    NSString *nick = [LSLoginDataModel getUserInfoDatas].userInfo.nickName;
//    _nickLabel.text = (!nick || nick.length == 0)?@"请设置您的昵称":nick;
//    _remarkLabel.text = [[LSLoginDataModel getUserInfoDatas].userInfo.remark isEqualToString:@""]?@"还没有设置个人介绍~赶紧去编辑":[LSLoginDataModel getUserInfoDatas].userInfo.remark;
//    //中间部分设值
//    _collectLabel.text = model.collectCount;
//    _attendLabel.text = model.attentionCount;
//    _fansLabel.text = model.fansCount;
//    _energyLabel.text = model.energyCount;
//    _energyRedDot.hidden = !model.isEnergy.boolValue;
//    _emblemBtn.hidden = (!model.badge || model.badge.length == 0);
//    _gradeBtn.hidden = (!model.level || model.level.length == 0);
//    [_emblemBtn setTitle:model.badge forState:UIControlStateNormal];
//    [_gradeBtn  setTitle:model.level forState:UIControlStateNormal];
//    _iconImageView.ls_verifyBadge = model.isAuthDoctor.integerValue;
//}
- (IBAction)nextSetInfoClick:(id)sender {
    
    
   // [self routerEventName:@"设置" routerInfo:nil];
    
    
}
- (IBAction)emblemBtnClick:(id)sender {
    
   // [self routerEventName:@"徽章" routerInfo:nil];
}
- (IBAction)gradeBtnClick:(id)sender {
    
   // [self routerEventName:@"等级" routerInfo:nil];
}

- (IBAction)midBarButtonClick:(UIButton *)sender {
    NSString *routName = @"";
    switch (sender.tag - 200) {
        case 0:
            routName = @"收藏";
            break;
        case 1:
            routName = @"关注";
            break;
        case 2:
            routName = @"粉丝";
            break;
        case 3:
            routName = @"能量值";
            break;
        default:
            break;
    }
    //[self routerEventName:routName routerInfo:nil];
}
- (IBAction)siginBtnClick:(id)sender {
    
    //[self routerEventName:@"签到" routerInfo:nil];
    
}

@end
