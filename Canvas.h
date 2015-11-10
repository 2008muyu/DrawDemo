//
//  Canvas.h
//  DrawDemo
//
//  Created by mby on 15/11/5.
//  Copyright © 2015年 mby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brush.h"

@interface Canvas : UIView

@property (nonatomic, strong) UIColor* color;
@property (nonatomic, strong) Brush* brush;

- (void)clear;

@end
