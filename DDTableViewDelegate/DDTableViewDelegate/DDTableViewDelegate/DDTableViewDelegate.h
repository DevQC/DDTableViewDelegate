//
//  DDTableViewDelegate.h
//  DDTableViewDelegate
//
//  Created by RY_Deven on 2018/8/7.
//  Copyright © 2018年 RY004. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DDTableListItem.h"

typedef void (^DDTableViewCellConfigureBlock)(NSIndexPath* indexPath, id cell, id item);
typedef void (^DDTableViewCellDidSelectBlock)(NSIndexPath* indexPath, id cell, id item);
typedef CGFloat (^DDTableViewCellHeightBlock)(NSIndexPath* indexPath, id item);
typedef UIView * (^DDTableViewSectionHeaderViewBlock)(NSInteger section);
typedef UIView * (^DDTableViewSectionfooterViewBlock)(NSInteger section);

@interface DDTableViewDelegate : NSObject <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) DDTableViewSectionfooterViewBlock sectionFooterBlock;

@property (nonatomic, copy) DDTableViewSectionHeaderViewBlock sectionHeaderBlock;

- (id)initWithListData:(NSArray <DDTableListItem *>*)data
    configureCellBlock:(DDTableViewCellConfigureBlock)aConfigureCellBlock
       cellHeightBlock:(DDTableViewCellHeightBlock)aHeightBlock
        didSelectBlock:(DDTableViewCellDidSelectBlock)aDidSelectBlock;

- (void)configTableView:(UITableView*)aTableView;

- (void)reloadTableView:(UITableView*)aTableView
              tableData:(NSArray <DDTableListItem *>*)data;



@end






