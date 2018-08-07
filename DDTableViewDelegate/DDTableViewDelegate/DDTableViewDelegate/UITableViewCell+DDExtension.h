//
//  UITableViewCell+Extension.h
//  DDTableViewDelegate
//
//  Created by RY_Deven on 2018/8/7.
//  Copyright © 2018年 RY004. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (DDExtension)

//注册cell
+ (void)registerTabelView:(UITableView*)aTable
            nibIdentifier:(NSString*)identifier;

//载入数据
- (void)configure:(UITableViewCell*)aCell
        custimObj:(id)obj
        indexPath:(NSIndexPath*)indexPath;

+ (NSString *)cellIdentify;

//根据数据源计算cell高度 默认返回44.0f
+ (CGFloat)getCellHeightWitCustomObj:(id)obj
                           indexPath:(NSIndexPath*)indexPath;


@end
