//
//  DDTableListItem.h
//  DDTableViewDelegate
//
//  Created by RY_Deven on 2018/8/7.
//  Copyright © 2018年 RY004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDTableListItem : NSObject

@property (nonatomic, assign) float sectionHeaderHeight;

@property (nonatomic, assign) float sectionFooterHeight;

@property (nonatomic, copy)  NSString *cellIdentify;

@property (nonatomic, copy)  NSArray *listData;

@end
