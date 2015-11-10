//
//  Toolbar.m
//  DrawDemo
//
//  Created by mby on 15/11/6.
//  Copyright © 2015年 mby. All rights reserved.
//

#import "Toolbar.h"
#import "ToolbarButtonModel.h"

@interface Toolbar ()

@property (nonatomic, strong) UIButton* createNew;


@end

@implementation Toolbar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.35];
        NSArray* names = @[@"清除", @"保存",@"色板", @"收回"];
        CGFloat btnHeight = 0.0;
        for (int i = 0; i < lineNumber; i++) {
            ToolbarButtonModel* btn = [[ToolbarButtonModel alloc] initWithIndex:i];
            [btn setTitle:[NSString stringWithFormat:@"%@",names[i]] forState:(UIControlStateNormal)];
            [btn addTarget:self action:@selector(barBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:btn];
            btnHeight = btn.frame.size.height;
        }
        
        self.frame = CGRectMake(0, SCREEN_HEIGHT-btnHeight, SCREEN_WIDTH, btnHeight);
        
    }
    return self;
}

- (void)hide {
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:(UIViewAnimationOptionTransitionFlipFromRight) animations:^{
        self.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT-self.frame.size.height, SCREEN_WIDTH, self.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)show {
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:(UIViewAnimationOptionTransitionFlipFromRight) animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT-self.frame.size.height, SCREEN_WIDTH, self.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)barBtnAction:(ToolbarButtonModel*)btn {
    if ([self.delegate respondsToSelector:@selector(toolbarButtonClickWithIndex:)]) {
        [_delegate toolbarButtonClickWithIndex:btn.index];
    }
}


@end
