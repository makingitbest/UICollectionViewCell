//
//  CollectionCellClassType.h
//  UICollectionViewCell
//
//  Created by WangQiao on 16/7/17.
//  Copyright © 2016年 wq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionCellClassType : NSObject

/**
 *  注册的cell的那个类
 */
@property (nonatomic, strong) Class className;

/**
 *  注册cell的标示字符串
 */
@property (nonatomic, strong) NSString *reuseIndentifier;

@end
