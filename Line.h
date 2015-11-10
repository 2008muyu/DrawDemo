//
//  Line.h
//  DrawDemo
//
//  Created by mby on 15/11/5.
//  Copyright © 2015年 mby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Line : NSObject

@property (nonatomic) CGPoint beganPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic, strong) UIColor* color;

@end
