//
//  SettingTableViewController.m
//  TbSettingProject
//
//  Created by Tb on 2021/4/30.
//


#define  ATdeviceScaleWidth  [UIScreen mainScreen].bounds.size.width
#define  ATdeviceScaleHight  [UIScreen mainScreen].bounds.size.height


#import "SettingTableViewController.h"
#import "CustomCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "CustomTableViewCell.h"

#import "Tool.h"
#import <MJExtension/MJExtension.h>
#import "SettingModel.h"
#import "LSNewMineHeaderView.h"

@interface SettingTableViewController ()
@property (nonatomic, strong)NSArray <SettingModel *>* settingModelArray;
@end

@implementation SettingTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self loadData];
}

- (void)loadData {
    
    NSArray *settingArray = [Tool readFileWithFileName:@"Setting"];
    NSLog(@"array:%@",settingArray);
    
    self.settingModelArray = [SettingModel mj_objectArrayWithKeyValuesArray:settingArray];
    [self.tableView reloadData];
    
}

- (void)setupTableView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"setting"];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    
    UIView *headerBgView  = [UIView new];
    headerBgView.frame = CGRectMake(0, 0, ATdeviceScaleWidth, 185);
    LSNewMineHeaderView *minHeaderView = [LSNewMineHeaderView initNewMineHeaderView];
    [headerBgView addSubview:minHeaderView];
    minHeaderView.frame = headerBgView.bounds;
    self.tableView.tableHeaderView = headerBgView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.settingModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setting"];
    cell.settingModel = self.settingModelArray[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *iv = [UIView new];
    iv.backgroundColor = [UIColor clearColor];
    return iv;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingModel *settingModel = self.settingModelArray[indexPath.section];
    NSUInteger menuNum = settingModel.subMenus.count;

    NSInteger row = menuNum / 4;
    NSInteger col = menuNum % 4;
    if (col != 0) {
        row = row + 1;
    }
    return row * 90 + 45;
}

@end
