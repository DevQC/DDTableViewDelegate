//
//  DDTableViewDelegate.m
//  DDTableViewDelegate
//
//  Created by RY_Deven on 2018/8/7.
//  Copyright © 2018年 RY004. All rights reserved.
//

#import "DDTableViewDelegate.h"
#import "UITableViewCell+DDExtension.h"

@interface DDTableViewDelegate()
@property (nonatomic, copy) NSArray <DDTableListItem *>*data;
@property (nonatomic, copy) DDTableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) DDTableViewCellDidSelectBlock didSelectBlock;
@property (nonatomic, copy) DDTableViewCellHeightBlock heightBlock;
@end

@implementation DDTableViewDelegate

- (id)initWithListData:(NSArray <DDTableListItem *>*)data
    configureCellBlock:(DDTableViewCellConfigureBlock)aConfigureCellBlock
       cellHeightBlock:(DDTableViewCellHeightBlock)aHeightBlock
        didSelectBlock:(DDTableViewCellDidSelectBlock)aDidSelectBlock
{
    if (self = [super init]) {
        self.data = data;
        self.configureCellBlock = aConfigureCellBlock;
        self.heightBlock = aHeightBlock;
        self.didSelectBlock = aDidSelectBlock;
    }
    return self;
}


#pragma mark - TableView delegate && dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DDTableListItem *item = self.data[section];
    return item.listData.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDTableListItem *item = self.data[indexPath.section];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:item.cellIdentify];
    if (!cell) {
        [UITableViewCell registerTabelView:tableView nibIdentifier:item.cellIdentify];
        cell = [tableView dequeueReusableCellWithIdentifier:item.cellIdentify];
    }
    id cellData = item.listData[indexPath.row];
    self.configureCellBlock(indexPath,cell,cellData);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DDTableListItem *item = self.data[indexPath.section];
    id cell = [tableView cellForRowAtIndexPath:indexPath];
    self.didSelectBlock(indexPath,cell,item.listData[indexPath.row]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDTableListItem *item = self.data[indexPath.section];
    return self.heightBlock(indexPath,item.listData[indexPath.row]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    DDTableListItem *item = self.data[section];
    return item.sectionFooterHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    DDTableListItem *item = self.data[section];
    return item.sectionHeaderHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.sectionFooterBlock) {
        return self.sectionFooterBlock(section);
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.sectionHeaderBlock) {
        return self.sectionHeaderBlock(section);
    }
    return nil;
}

#pragma mark - 注册delegate,datasource
- (void)configTableView:(UITableView *)aTableView{
    aTableView.delegate = self;
    aTableView.dataSource = self;
}

#pragma mark - relaod data

- (void)reloadTableView:(UITableView *)aTableView
              tableData:(NSArray<DDTableListItem *> *)data
{
    self.data = data;
    [aTableView reloadData];
}


@end
