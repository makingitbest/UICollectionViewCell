//
//  CollectionGridView.h
//  UICollectionViewCell
//
//  Created by WangQiao on 16/7/17.
//  Copyright © 2016年 wq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionCellClassType.h"
#import "CustomCollectionViewCell.h"

@class CollectionGridView;

@protocol CollectionGridViewDelegate <NSObject>

- (void)collectionGridView:(CollectionGridView *)collectionGridView didSelectedCell:(CustomCollectionViewCell *)cell ;

@end

@interface CollectionGridView : UIView

@property (nonatomic, weak) id <CollectionGridViewDelegate> delegate;

/**
 *  collectionView的左右边距
 */
@property (nonatomic) UIEdgeInsets contentEdegeInsets;

/**
 *  cell的水平gap
 */
@property (nonatomic) CGFloat horizonGap;

/**
 *  cell的垂直gap
 */
@property (nonatomic) CGFloat verticalGap;

/**
 *  cell的水平个数
 */
@property (nonatomic) NSInteger horizonCellCount;

/**
 *  cell的高度
 */
@property (nonatomic) CGFloat cellHeight;

/**
 *  转数据的数组
 */
@property (nonatomic, strong) NSArray <id> * dataArray;

/**
 * 注册cell
 */
@property (nonatomic, strong) CollectionCellClassType *registCell;

/**
 *  重新设置collectionView的坐标值,大小
 */
- (void)setUp;

/**
 *  刷新数据,用于实现单个cell的选择状态
 */
- (void)reloadData;

@end
