//
//  Brush.h
//  DrawDemo
//
//  Created by mby on 15/11/5.
//  Copyright © 2015年 mby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Brush : NSObject

- (instancetype)initWithColor:(UIColor*)color withWidth:(CGFloat)width;

@property (nonatomic, strong) UIColor* color;

@property (nonatomic, assign) CGFloat width;

@end
