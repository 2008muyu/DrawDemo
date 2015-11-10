//
//  Brush.m
//  DrawDemo
//
//  Created by mby on 15/11/5.
//  Copyright © 2015年 mby. All rights reserved.
//

#import "Brush.h"

@interface Brush ()

@property (nonatomic, strong) UIColor* defaultColor;
@property (nonatomic, assign) CGFloat defaultWidth;


@end

@implementation Brush

- (instancetype)init
{
    return [self initWithColor:self.defaultColor withWidth:self.defaultWidth];;
}

- (instancetype)initWithColor:(UIColor*)color withWidth:(CGFloat)width
{
    self = [super init];
    if (self) {
        self.color = color;
        self.width = width;
    }
    return self;
}

#pragma mark property method

- (void)setColor:(UIColor *)color {
    _color = color;
}

- (void)setWidth:(CGFloat)width {
    _width = width;
}

- (UIColor *)defaultColor {
    return [UIColor blackColor];
}

- (CGFloat)defaultWidth {
    return 2.0f;
}

@end
