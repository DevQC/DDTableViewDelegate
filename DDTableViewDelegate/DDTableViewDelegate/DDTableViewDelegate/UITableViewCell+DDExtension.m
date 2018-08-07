//
//  UITableViewCell+Extension.m
//  DDTableViewDelegate
//
//  Created by RY_Deven on 2018/8/7.
//  Copyright © 2018年 RY004. All rights reserved.
//

#import "UITableViewCell+DDExtension.h"

@implementation UITableViewCell (DDExtension)

//注册cell
+ (void)registerTabelView:(UITableView*)aTable
            nibIdentifier:(NSString*)identifier{
    [aTable registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
}

//载入数据
- (void)configure:(UITableViewCell*)aCell
        custimObj:(id)obj
        indexPath:(NSIndexPath*)indexPath{
    
}

//根据数据源计算cell高度 默认返回44.0f
+ (CGFloat)getCellHeightWitCustomObj:(id)obj
                           indexPath:(NSIndexPath*)indexPath{
    return 44.0f;
}

@end
