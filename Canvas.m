//
//  Canvas.m
//  DrawDemo
//
//  Created by mby on 15/11/5.
//  Copyright © 2015年 mby. All rights reserved.
//

#import "Canvas.h"
#import "Line.h"

@interface Canvas ()

@property (nonatomic, strong) NSMutableArray* lineArray;

@property (nonatomic, strong) Line* currentLine;

@end

@implementation Canvas

- (instancetype)init
{
    return [self initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        self.color = self.backgroundColor;
        [self becomeFirstResponder];
        [self lineArray];
        [self currentLine];
    }
    return self;
}

- (void)clear {
    [_lineArray removeAllObjects];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.brush.width);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    for (Line* l in _lineArray) {
        [l.color set];
        CGContextMoveToPoint(context, l.beganPoint.x, l.beganPoint.y);
        CGContextAddLineToPoint(context, l.endPoint.x, l.endPoint.y);
        CGContextStrokePath(context);
        
    }
}


#pragma mark -- touch event
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        Line* newLine = [[Line alloc] init];
        newLine.beganPoint = [t locationInView:self];
        newLine.color = _brush.color;
        [_lineArray addObject:newLine];
        
        _currentLine = newLine;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    for (UITouch* t in touches) {
        
        _currentLine.endPoint = [t locationInView:self];
        [_lineArray addObject:_currentLine];
        
        Line* newLine = [[Line alloc] init];
        newLine.beganPoint = [t locationInView:self];
        newLine.endPoint = [t locationInView:self];
        newLine.color = _brush.color;
        _currentLine = newLine;
    }
    
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch* t in touches) {
        _currentLine.endPoint = [t locationInView:self];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

#pragma mark -- property method
- (Line *)currentLine {
    if (!_currentLine) {
        _currentLine = [[Line alloc] init];
    }
    return _currentLine;
}

- (NSMutableArray *)lineArray {
    if (!_lineArray) {
        _lineArray = [[NSMutableArray alloc] init];
    }
    return _lineArray;
}

@end
