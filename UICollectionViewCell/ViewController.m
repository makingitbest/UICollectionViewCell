//
//  ViewController.m
//  UICollectionViewCell
//
//  Created by WangQiao on 16/7/17.
//  Copyright © 2016年 wq. All rights reserved.
//

#import "ViewController.h"
#import "CollectionGridView.h"
#import "CollectionCellClassType.h"
#import "TestCell.h"

@interface ViewController () <CollectionGridViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CollectionGridView * gridView = [[CollectionGridView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 400)];
    
    gridView.cellHeight         = 40;
    gridView.contentEdegeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    gridView.horizonGap         = 20;
    gridView.verticalGap        = 20;
    gridView.horizonCellCount   = 3;
    gridView.delegate           = self;
    
    gridView.dataArray = @[ @[@"wo", @"shi", @"ni", @"jie"],
                           @"ni", @"zhi", @"dao", @"ma", @"?"];
    
    CollectionCellClassType * cellType = [[CollectionCellClassType alloc] init];
    cellType.className                 = [TestCell class];
    cellType.reuseIndentifier          = @"TestCell";
    
    gridView.registCell = cellType;
    [gridView setUp];
    
    [self.view addSubview:gridView];

}

- (void)collectionGridView:(CollectionGridView *)collectionGridView didSelectedCell:(CustomCollectionViewCell *)cell {
    
    NSLog(@"我被点击了, 用于处理点击事件");

}

@end
