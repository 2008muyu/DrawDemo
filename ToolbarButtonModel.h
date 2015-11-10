//
//  ToolbarButtonModel.h
//  DrawDemo
//
//  Created by mby on 15/11/6.
//  Copyright © 2015年 mby. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger lineNumber = 4;
static CGFloat edge = 20;

@interface ToolbarButtonModel : UIButton

@property (nonatomic, readonly, assign) NSInteger index;

- (instancetype)initWithIndex:(NSInteger)index;


@end
