//
//  CollectionGridView.m
//  UICollectionViewCell
//
//  Created by WangQiao on 16/7/17.
//  Copyright © 2016年 wq. All rights reserved.
//

#import "CollectionGridView.h"

@interface CollectionGridView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView           *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation CollectionGridView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.flowLayout     = [[UICollectionViewFlowLayout alloc] init];
        
        self.collectionView            = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        self.collectionView.delegate   = self;
        self.collectionView.dataSource = self;
        [self addSubview:self.collectionView];
        
    }
    return self;
}

-(void)setUp {

    self.flowLayout.minimumLineSpacing      = self.horizonGap;     // 水平的gap
    self.flowLayout.minimumInteritemSpacing = self.verticalGap;    // 垂直的gap
    
    self.collectionView.contentInset = self.contentEdegeInsets;    // collectionView的内边距
    
    CGFloat cellWidth = (self.bounds.size.width - self.contentEdegeInsets.left - self.contentEdegeInsets.right - (self.horizonCellCount - 1) * self.horizonGap ) / self.horizonCellCount;
    self.flowLayout.itemSize = CGSizeMake(cellWidth, self.cellHeight); //每个cell的宽度,这个需要计算,高度给定
    
    NSInteger count = 0;
    self.dataArray.count % self.horizonCellCount == 0 ? (count = self.dataArray.count / self.horizonCellCount) : (count = self.dataArray.count / self.horizonCellCount + 1) ;
    CGFloat collectionHeight = count * self.cellHeight + (count - 1) * self.verticalGap + self.contentEdegeInsets.top + self.contentEdegeInsets.bottom;
    
    // 改变collectionView的frame  ,没什么作用
    self.collectionView.frame = CGRectMake(0, 0, self.bounds.size.width, collectionHeight);
    
   // 改变view的坐标, 移动collectionView的位置 搞清楚frame与bounce的区别
    self.frame                = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, collectionHeight);
    
    self.collectionView.layer.borderWidth = 2;
    self.collectionView.backgroundColor   = [UIColor redColor];
    
    // 注册cell
    [self.collectionView registerClass:self.registCell.className  forCellWithReuseIdentifier:self.registCell.reuseIndentifier];

}

#pragma mark - UICollectionViewDeLegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.registCell.reuseIndentifier forIndexPath:indexPath];
    
    cell.layer.borderWidth = 2;
    cell.data              = self.dataArray[indexPath.row];
    cell.indexPath         = indexPath;
    
    [cell loadContent];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    CustomCollectionViewCell *cell = (id)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell selectEvent];

    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionGridView:didSelectedCell:)]) {
        
        return [self.delegate collectionGridView:self didSelectedCell:cell];
    }
}

- (void)reloadData {

    [self.collectionView reloadData];

}

@end
