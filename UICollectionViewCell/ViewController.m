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
#import "SelectedModel.h"

@interface ViewController () <CollectionGridViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSMutableArray *mulArray = [NSMutableArray array];
    
    
    CollectionGridView * gridView = [[CollectionGridView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 400)];
    gridView.backgroundColor = [UIColor greenColor];
    
    
    UILabel *label        = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.view.bounds.size.width, 40)];
    label.text            = @"我是标题";
    label.font            = [UIFont systemFontOfSize:15];
    label.textAlignment   = NSTextAlignmentLeft;
    [gridView addSubview:label];
    
    gridView.cellHeight         = 40;
    gridView.contentEdegeInsets = UIEdgeInsetsMake(60, 10, 10, 10);
    gridView.horizonGap         = 20;
    gridView.verticalGap        = 20;
    gridView.horizonCellCount   = 3;
    gridView.delegate           = self;
    
    
    NSArray *array = @[ @"oo", @"ni", @"zhi", @"dao", @"ma", @"?"];
    for (NSString *name in array) {
        SelectedModel *model = [[SelectedModel alloc] init];
        model.typeName       = name;
        [mulArray addObject:model];
    }
    
    gridView.dataArray = mulArray;
    
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
