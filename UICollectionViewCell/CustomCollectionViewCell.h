//
//  CustomCollectionViewCell.h
//  UICollectionViewCell
//
//  Created by WangQiao on 16/7/17.
//  Copyright © 2016年 wq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

/**
 *  数据
 */
@property (nonatomic, weak) id data;

/**
 *  index
 */
@property (nonatomic, weak) NSIndexPath *indexPath;

/**
 *  设置collectionCell 的属性
 */
- (void)setUpCell;

/**
 *  在cell上摆控件,类似label button
 */
- (void)buildSubviews;

/**
 *  传数据
 */
- (void)loadContent;

/**
 *  点击事件
 */
- (void)selectEvent;
@end
