//
//  TestCell.m
//  UICollectionViewCell
//
//  Created by WangQiao on 16/7/17.
//  Copyright © 2016年 wq. All rights reserved.
//

#import "TestCell.h"
#import "SelectedModel.h"

typedef enum : NSUInteger {
    
    kNormalStatus = 50,
    kSelectedStatus,
    
} EStatusType;

@interface TestCell ()

@property (nonatomic, strong) UIView  *backView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation TestCell

- (void)setUpCell {

}

- (void)buildSubviews {
    
    self.backView                    = [[UIView alloc] initWithFrame:self.bounds];
    self.backView.layer.borderWidth  = 0.5;
    self.backView.layer.cornerRadius = 3;
    self.backView.layer.borderColor  = [UIColor grayColor].CGColor;
    [self addSubview:self.backView];
    
    self.label               = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.font          = [UIFont systemFontOfSize:14];
    self.label.textColor     = [UIColor redColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.backView addSubview:self.label];
    

}

- (void)loadContent {
    
    SelectedModel *model = self.data;
    self.label.text      = model.typeName;
    
    if (model.selected == YES) {
        
        [self changeToState:kSelectedStatus animation:NO];
        
    } else {
        
        [self changeToState:kNormalStatus animation:NO];
    }
    
}

- (void)changeToState:(EStatusType)state animation:(BOOL)animation{
    
    if (state == kNormalStatus) {
        
        if (animation) {
            
            [UIView animateWithDuration:0.5 animations:^{
                
                    self.backView.backgroundColor = [UIColor whiteColor];
            
            }];
        } else {
            
            self.backView.backgroundColor = [UIColor whiteColor];
        
        }
    }
    
    
    if (state == kSelectedStatus) {
        
        if (animation) {
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.backView.backgroundColor = [UIColor yellowColor];
                
            }];
        } else {
            
            self.backView.backgroundColor = [UIColor yellowColor];
            
        }
    }
}

- (void)selectEvent {
    
    SelectedModel *model = self.data;
    
    if (model.selected == YES) {
        
        model.selected = NO;
        [self changeToState:kNormalStatus animation:YES];
        
    } else {
    
        model.selected = YES;
        [self changeToState:kSelectedStatus animation:YES];
    
    }
}

@end
