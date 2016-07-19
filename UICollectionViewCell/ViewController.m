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
    NSArray *array = @[@"wo", @"xi",@"huan", @"ni", @"&", @"ni",@"zhi", @"dao",
                       @"ma",@"?",@"ni",@"yong",@"yuan",@"dou",@"bu",@"hui",@"fa",
                       @"xian",@"zhe",@"jian",@"shi",@"qing",@".",
                       @"wo",@"de",@"biao",@"bai"];
    for (NSString *name in array) {
        SelectedModel *model = [[SelectedModel alloc] init];
        model.typeName       = name;
        [mulArray addObject:model];
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    UILabel *label        = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.view.bounds.size.width, 40)];
    label.text            = @"我是标题";
    label.font            = [UIFont systemFontOfSize:15];
    label.textAlignment   = NSTextAlignmentLeft;
    [view addSubview:label];
    
    CollectionGridView * gridView = [[CollectionGridView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 400)];
    gridView.backgroundColor      = [UIColor greenColor];
    gridView.cellHeight           = 40;
    gridView.contentEdegeInsets   = UIEdgeInsetsMake(10, 10, 10, 10);
    gridView.horizonGap           = 20;
    gridView.verticalGap          = 20;
    gridView.horizonCellCount     = 3;
    gridView.delegate             = self;
    gridView.dataArray            = mulArray;
    
    CollectionCellClassType * cellType = [[CollectionCellClassType alloc] init];
    cellType.className                 = [TestCell class];
    cellType.reuseIndentifier          = @"TestCell";
    
    gridView.registCell = cellType;
    [gridView setUp];
    [self.view addSubview:gridView];
}

- (void)collectionGridView:(CollectionGridView *)collectionGridView didSelectedCell:(CustomCollectionViewCell *)cell {
    
    NSLog(@"我被点击了, 用于处理点击事件, 这个方法实现的cell的单项选择, 如果多选就不要实现这个枚举了和reloadData");
    
    [collectionGridView.dataArray enumerateObjectsUsingBlock:^(SelectedModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        
        cell.indexPath.row == idx ? (model.selected = YES) : (model.selected = NO);
        
    }];
    
    [collectionGridView reloadData];
}

@end
